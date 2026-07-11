// SPDX-License-Identifier: MIT
// License identifier. It tells tools and readers that this source code uses the MIT license.

pragma solidity ^0.8.20;
// Compiler version requirement. This contract should be compiled with Solidity 0.8.20 or a compatible newer 0.8.x version.

contract OnchainTodo {
    // A Todo is one onchain task record.
    // It stores who created the task, what the task says, whether it is completed,
    // and when it was created or last updated.
    struct Todo {
        // The wallet address that created this todo.
        address owner;

        // The text content of the todo.
        string content;

        // Whether this todo is completed.
        bool completed;

        // The block timestamp when this todo was created.
        uint256 createdAt;

        // The block timestamp when this todo was last updated.
        uint256 updatedAt;
    }

    // A private list that stores all todos.
    // "private" does not make the data secret onchain; it only means other contracts
    // cannot directly call an automatically generated getter.
    Todo[] private todos;

    // Event emitted after a todo is created.
    // Frontends and block explorers can listen to this log.
    event TodoCreated(uint256 indexed todoId, address indexed owner, string content);

    // Event emitted after a todo's completed status is changed.
    event TodoCompleted(uint256 indexed todoId, address indexed owner, bool completed);

    // Create a new todo.
    // This changes blockchain state, so calling it as a transaction will cost gas.
    function createTodo(string calldata content) external {
        // Reject empty todo content.
        require(bytes(content).length > 0, "Todo content cannot be empty");

        // Add a new Todo record to the todos array.
        // msg.sender is the address that called this function.
        // block.timestamp is the timestamp of the block that includes this transaction.
        todos.push(
            Todo({
                owner: msg.sender,
                content: content,
                completed: false,
                createdAt: block.timestamp,
                updatedAt: block.timestamp
            })
        );

        // Write a log so external tools can easily notice that a todo was created.
        emit TodoCreated(todos.length - 1, msg.sender, content);
    }

    // Update whether a todo is completed.
    // Only the wallet that created the todo can update it.
    function setCompleted(uint256 todoId, bool completed) external {
        // Make sure the todoId points to an existing todo.
        require(todoId < todos.length, "Todo does not exist");

        // Make sure the caller is the original creator of this todo.
        require(todos[todoId].owner == msg.sender, "Only owner can update this todo");

        // Update the todo's status and timestamp.
        todos[todoId].completed = completed;
        todos[todoId].updatedAt = block.timestamp;

        // Write a log so external tools can easily notice the status change.
        emit TodoCompleted(todoId, msg.sender, completed);
    }

    // Read one todo by its id.
    // This is a view function, so it only reads state and does not change state.
    function getTodo(uint256 todoId)
        external
        view
        returns (
            address owner,
            string memory content,
            bool completed,
            uint256 createdAt,
            uint256 updatedAt
        )
    {
        // Make sure the requested todo exists before reading it.
        require(todoId < todos.length, "Todo does not exist");

        // Use a storage reference to read the todo from the onchain array.
        Todo storage todo = todos[todoId];

        // Return the todo fields in a simple format.
        return (todo.owner, todo.content, todo.completed, todo.createdAt, todo.updatedAt);
    }

    // Read the total number of todos created in this contract.
    function getTodoCount() external view returns (uint256) {
        return todos.length;
    }
}

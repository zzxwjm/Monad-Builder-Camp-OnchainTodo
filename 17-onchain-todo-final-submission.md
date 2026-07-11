# Week 1 - AI 辅助开发 - Onchain Todo 最终提交

## 1. 我使用的 Prompt

### 原始 Prompt

```text
现在我们开始这个项目吧。你之前已经向我解释过这个任务的需求了。现在请你先帮助我清晰地理解这个任务。然后我们一起做一个onchain Todo的demo
```

### AI 协助后改进的 Prompt

```text
请帮我生成一个最小的 Solidity Onchain Todo 合约，适合 Web3 初学者阅读和检查。

要求：
1. 使用 Solidity ^0.8.20。
2. 用户可以创建一条 todo，内容是字符串。
3. 每条 todo 需要记录创建者地址、内容、是否完成、创建时间、更新时间。
4. 用户只能修改自己创建的 todo 的完成状态。
5. 提供读取某条 todo 和读取 todo 总数的函数。
6. 不要加入 owner 管理员、删除功能、付费逻辑、复杂权限系统或外部依赖。
7. 代码命名要清晰，并加入必要的 event。
8. 请用简短文字解释合约结构，方便我人工检查。
```

### Prompt 改进说明

我的原始 Prompt 适合开启协作，但不够精确。改进后的 Prompt 补充了 Solidity 版本、最小功能、权限规则、不要加入的复杂功能、安全边界和解释要求。这样 AI 更容易生成一个适合初学者人工检查的合约。

## 2. AI 生成的主要输出

AI 生成了一个最小 `OnchainTodo` Solidity 合约，主要包括：

- `Todo` 结构体：记录一条 todo 的创建者、内容、完成状态、创建时间和更新时间。
- `todos` 数组：保存所有 todo。
- `createTodo` 函数：创建新的 todo。
- `setCompleted` 函数：修改 todo 的完成状态。
- `getTodo` 函数：读取指定 todo。
- `getTodoCount` 函数：读取 todo 总数。
- `TodoCreated` 和 `TodoCompleted` 事件：记录 todo 创建和状态更新。

AI 也解释了合约结构，并提醒链上 todo 内容是公开的，不应写入隐私信息。

## 3. 合约源码

```solidity
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
```

## 4. 我做过的人工修改或判断说明

1. 保留 `owner` 字段和权限检查，因为如果没有 owner，任何地址都可以修改任何 todo。
2. 保留 `require(bytes(content).length > 0)`，避免创建空 todo。
3. 保留 `createdAt` 和 `updatedAt`，方便理解链上状态变化发生的时间。
4. 保留 `event`，因为事件方便前端或区块浏览器追踪 todo 创建和更新。
5. 使用 `private todos + getTodo`，让读取接口更清晰。
6. 没有加入管理员 owner，因为这个 demo 不需要中心化管理员。
7. 没有加入删除功能，因为删除会增加复杂度，不适合作为最小 demo。
8. 没有加入付款、token、NFT 或外部依赖，因为本任务重点是理解最小智能合约结构。
9. 判断该合约不适合记录私人事项，因为链上数据公开可查。

## 5. AI 生成代码需要人工检查的地方

### 检查点 1：合约是否能编译

我在 Remix 2.5.2 中使用 Remix VM 完成了编译和部署。

- Contract：`OnchainTodo`
- Deploy：成功
- Deployment value：`0 wei`
- Remix VM 部署交易 hash：`0xd77...9411f`

说明：这个 hash 来自 Remix VM，只代表本地模拟链部署，不是 Monad Testnet 上的真实交易。

### 检查点 2：函数是否符合预期

我在 Remix VM 中确认了最小功能路径可以跑通：

```text
部署合约 -> 创建 todo -> 读取 todo 数量 -> 读取 todo 内容 -> 修改完成状态 -> 再次读取确认
```

已确认：

- `createTodo("Learn Solidity basics")` 可以创建 todo。
- `getTodoCount()` 返回了预期数量。
- `getTodo(0)` 可以读取第一条 todo。
- `setCompleted(0, true)` 可以把第一条 todo 标记为完成。
- 再次调用 `getTodo(0)` 时，`completed` 已变成 `true`。

### 检查点 3：是否存在明显权限问题

我重点检查了 `setCompleted` 函数：

```solidity
require(todos[todoId].owner == msg.sender, "Only owner can update this todo");
```

这表示只有创建 todo 的地址可以修改这条 todo 的完成状态，其他地址不能修改。

### 检查点 4：是否使用了不必要的复杂逻辑

当前合约没有管理员、没有删除功能、没有付款逻辑、没有 token/NFT、没有外部依赖。对于最小 Onchain Todo demo 来说，复杂度合适。

### 检查点 5：是否有安全或隐私风险

这个合约不处理真实资产，所以金融风险较低。但 todo 内容会上链，链上数据公开可查，因此不能写入隐私信息、真实身份信息、私钥、助记词、API Key 或其他敏感内容。

### 检查点 6：变量和函数命名是否容易理解

`createTodo`、`setCompleted`、`getTodo`、`getTodoCount` 都能直接表达用途。`owner`、`content`、`completed`、`createdAt`、`updatedAt` 也比较容易理解，适合初学者阅读。

## 6. 我的总结

这个 demo 让我理解到：智能合约可以是一个很小的链上规则系统。`createTodo` 和 `setCompleted` 都是链上状态改变。AI 可以帮助我生成初稿，但最终仍然需要我人工检查编译、功能、权限、复杂度和安全边界。

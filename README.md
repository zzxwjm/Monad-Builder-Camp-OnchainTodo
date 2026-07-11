# Web3 Learning Lab - Monad Builder Camp

This repository is my personal Web3 learning lab for Monad Builder Camp.

It records my beginner learning process, hands-on Monad Testnet practice, AI-assisted Solidity exercises, and daily build logs.

## Current Highlight: Onchain Todo

The main Solidity demo in this repository is a minimal `OnchainTodo` contract:

- Source code: `contracts/OnchainTodo.sol`
- Task note: `notes/14-ai-solidity-onchain-todo.md`
- Monad deployment note: `notes/18-monad-onchain-todo-deployment.md`
- AI Q&A record: `ai-notes/2026-07-10-ai-solidity-onchain-todo.md`

This demo was created for the Week 1 tasks:

- AI 辅助开发 - 用 AI 生成一个最小 Solidity 合约
- 智能合约实践 - 部署你的第一个 Monad 合约

The goal is not to build a production contract. The goal is to practice:

- writing a prompt for AI-assisted development
- reading AI-generated Solidity code
- asking AI to explain the contract structure
- manually checking compilation, functions, permissions, complexity, and safety
- recording what I accepted, modified, or judged in the AI output
- deploying the contract to Monad Testnet
- calling read and write functions from Remix
- verifying deployment and interaction with a block explorer

## Onchain Todo Features

`OnchainTodo` supports:

- creating a todo
- recording the creator address
- recording todo content
- marking a todo as completed or not completed
- reading one todo
- reading the total todo count

The contract intentionally avoids:

- admin owner logic
- payment logic
- deletion logic
- token or NFT logic
- external dependencies

This keeps the demo small enough for beginner-level manual inspection.

## Remix Verification

The contract was tested in Remix:

- Environment: Remix VM
- Contract: `OnchainTodo`
- Deploy: success
- Deployment value: `0 wei`
- Remix VM deployment transaction hash: `0xd77...9411f`

Manual function checks were confirmed:

- `createTodo("Learn Solidity basics")` created a todo.
- `getTodoCount()` returned the expected count.
- `getTodo(0)` returned the expected todo fields.
- `setCompleted(0, true)` updated the todo status.
- A second `getTodo(0)` confirmed `completed = true`.

The Remix VM hash is only a local simulated-chain transaction hash. It is not a Monad Testnet transaction hash.

## Monad Testnet Deployment

The contract was deployed to Monad Testnet from Remix with a course-only MetaMask wallet.

- Network: `Monad Testnet`
- Contract address: `0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990`
- Deployment transaction: `0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1`
- Write interaction: `createTodo(string)`
- Interaction transaction: `0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac`
- Read interactions: `getTodoCount()` and `getTodo(0)` were called from Remix.

`getTodo(0)` returned:

```text
owner: 0x2596976c6D2D5a301eFc3833e2749bDF368223e5
content: Learn Solidity on Monad
completed: false
createdAt: 1783786512
updatedAt: 1783786512
```

Explorer links:

- Contract: `https://testnet.monadvision.com/address/0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990`
- Deployment tx: `https://testnet.monadvision.com/tx/0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1`
- Interaction tx: `https://testnet.monadvision.com/tx/0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac`

## How to Deploy

1. Open `contracts/OnchainTodo.sol` in Remix.
2. Compile the contract with Solidity `^0.8.20`.
3. In `Deploy & Run Transactions`, choose `Browser Extension` as the environment.
4. Connect the course-only MetaMask wallet.
5. Confirm MetaMask is on `Monad Testnet`.
6. Select `OnchainTodo` and click `Deploy`.
7. Confirm the deployment transaction in MetaMask.
8. Save the deployed contract address and deployment transaction hash.

## How to Interact

After deployment, expand the deployed `OnchainTodo` contract in Remix.

Read functions:

- Call `getTodoCount()` to read the total number of todos.
- Call `getTodo(0)` to read the first todo.

Write functions:

- Call `createTodo("Learn Solidity on Monad")` to create a todo.
- Optional: call `setCompleted(0, true)` to mark the first todo as completed.

Write functions change Monad Testnet state and produce transaction hashes. Read functions only read state and usually do not produce transaction hashes.

## Structure

```text
notes/       Learning notes and concept summaries
labs/        Small exercises for each learning stage
apps/        Frontend applications
contracts/  Smart contracts, tests, and deployment scripts
docs/        Architecture and project design documents
ai-notes/    AI Q&A records and learning conversations
build-log/   Daily proof-of-work logs
changelog/   Modification history and project decisions
```

## Learning Flow

1. Learn web basics: HTML, CSS, JavaScript, HTTP, DOM.
2. Build small browser exercises in `labs/`.
3. Learn React and wallet UI.
4. Learn Ethereum concepts and Solidity.
5. Build full DApp projects by connecting frontend and contracts.

## Record-Keeping Rule

After each meaningful learning or coding session:

1. Add useful questions and answers to `ai-notes/`.
2. Add important concepts to `notes/`.
3. Add project changes to `changelog/changes.md`.
4. Add design decisions to `changelog/decisions.md` when the reason matters.

## Monad Builder Camp

This repository also tracks my Monad Builder Camp progress.

- Camp overview note: `notes/07-monad-builder-camp.md`
- Camp learning plan: `docs/monad-camp-learning-plan.md`
- Daily proof of work: `build-log/`

## Safety

This repository does not include private keys, seed phrases, API keys, access tokens, or `.env` files.

All wallet work is done with a course-only wallet.

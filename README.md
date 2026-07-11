# Mini Demo 0 - Onchain Todo on Monad Testnet

This repository is my Week 1 Mini Demo 0 for Monad Builder Camp.

It shows a complete beginner Web3 workflow:

```text
AI-assisted Solidity draft -> manual review -> Remix compile -> Monad Testnet deploy -> read/write contract interaction -> explorer verification
```

The demo is intentionally small. It is not a production contract. Its purpose is to prove that I can safely complete a basic onchain development and interaction loop.

## Demo Overview

`OnchainTodo` is a minimal Solidity contract that lets a wallet:

- create a todo
- store the creator address
- store todo content
- read a todo
- read the total todo count
- update a todo's completed status

The contract avoids admin logic, payment logic, deletion logic, token logic, NFT logic, and external dependencies. This keeps the code simple enough for beginner-level manual inspection.

## Week 1 Submission

For the Week 1 Mini Demo 0 task, the main submission materials are:

- Mini Demo 0 submission note: [notes/19-mini-demo-0-submission.md](notes/19-mini-demo-0-submission.md)
- Contract source: [contracts/OnchainTodo.sol](contracts/OnchainTodo.sol)
- AI-assisted Solidity submission: [notes/17-onchain-todo-final-submission.md](notes/17-onchain-todo-final-submission.md)
- Monad deployment note: [notes/18-monad-onchain-todo-deployment.md](notes/18-monad-onchain-todo-deployment.md)
- Week 1 build log and track reflection: [build-log/week-1-build-log-draft.md](build-log/week-1-build-log-draft.md)
- Screenshot guidance: [screenshots/README.md](screenshots/README.md)

## Monad Testnet Deployment

The contract was deployed to Monad Testnet from Remix with a course-only MetaMask wallet.

- Network: `Monad Testnet`
- Contract address: `0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990`
- Deployment transaction: `0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1`
- Write interaction: `createTodo("Learn Solidity on Monad")`
- Interaction transaction: `0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac`
- Read interactions: `getTodoCount()` and `getTodo(0)`

Explorer links:

- Contract: `https://testnet.monadvision.com/address/0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990`
- Deployment tx: `https://testnet.monadvision.com/tx/0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1`
- Interaction tx: `https://testnet.monadvision.com/tx/0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac`

`getTodo(0)` returned:

```text
owner: 0x2596976c6D2D5a301eFc3833e2749bDF368223e5
content: Learn Solidity on Monad
completed: false
createdAt: 1783786512
updatedAt: 1783786512
```

## AI-Assisted Work

AI helped me:

- understand the task requirements
- improve the original prompt into a precise Solidity generation prompt
- generate a minimal `OnchainTodo` draft
- explain the contract structure
- create a manual review checklist
- organize notes, README, and build logs

My original prompt was broad and conversational. The improved prompt specified Solidity version, minimal functions, permission rules, unnecessary features to avoid, and the need for code explanation.

## Manual Judgments

The final decisions were not delegated to AI. I manually judged that:

- a course-only wallet should be used
- private keys, seed phrases, API keys, and `.env` files must never be submitted
- `owner` permission checking is needed so only the creator can update a todo
- empty todo content should be rejected
- admin, payment, deletion, token, and NFT logic should be excluded
- todo content is public onchain data, so it should not contain private information
- Remix VM success is not the same as Monad Testnet deployment
- MonadVision links are needed to verify real onchain deployment and interaction

## Remix VM Verification

Before deploying to Monad Testnet, the contract was tested in Remix VM.

- Environment: Remix VM
- Contract: `OnchainTodo`
- Deploy: success
- Deployment value: `0 wei`
- Remix VM deployment transaction hash: `0xd77...9411f`

Manual function checks:

- `createTodo("Learn Solidity basics")` created a todo.
- `getTodoCount()` returned the expected count.
- `getTodo(0)` returned the expected todo fields.
- `setCompleted(0, true)` updated the todo status.
- A second `getTodo(0)` confirmed `completed = true`.

The Remix VM hash is a local simulated-chain transaction hash. It is not a Monad Testnet transaction hash.

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

## Week 2 Direction

My initial Week 2 direction is:

```text
Research as the main direction, Tech as practice support, Ops as communication support.
```

The Week 1 demo proves that I can complete a basic onchain workflow. For Week 2, I want to explore research questions around onchain behavior, AI agent task traces, reputation signals, and whether address-level actions can be meaningfully interpreted without confusing addresses with real-world people.

## Repository Structure

```text
contracts/     Solidity source code
notes/         Task submissions, research notes, and learning notes
build-log/     Daily and weekly proof-of-work logs
ai-notes/      AI Q&A records and learning conversations
docs/          Architecture and learning plan documents
changelog/     Change history and project decisions
screenshots/   Demo screenshots for submission
```

## Safety

This repository does not include private keys, seed phrases, API keys, access tokens, or `.env` files.

All wallet work is done with a course-only wallet.

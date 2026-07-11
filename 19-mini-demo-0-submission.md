# Week 1 Mini Demo 0 Submission

## Demo Name

```text
OnchainTodo on Monad Testnet
```

## 1. What I Built

I built a minimal Solidity contract called `OnchainTodo`.

The contract allows a wallet to:

- create a todo
- store the creator address
- store todo content
- read a todo
- read the total todo count
- update a todo's completed status

This is not a production app. It is a small demo for learning the full Web3 workflow from contract source code to real testnet interaction.

## 2. Real Onchain Operations

The contract was deployed to Monad Testnet.

Contract address:

```text
0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
```

Deployment transaction:

```text
0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
```

Write interaction:

```text
createTodo("Learn Solidity on Monad")
```

Interaction transaction:

```text
0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

Read functions:

```text
getTodoCount()
getTodo(0)
```

`getTodo(0)` returned:

```text
owner: 0x2596976c6D2D5a301eFc3833e2749bDF368223e5
content: Learn Solidity on Monad
completed: false
createdAt: 1783786512
updatedAt: 1783786512
```

Explorer links:

```text
https://testnet.monadvision.com/address/0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
https://testnet.monadvision.com/tx/0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
https://testnet.monadvision.com/tx/0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

## 3. AI-Assisted Parts

AI helped me:

- understand the task requirements
- improve my original prompt
- generate a minimal Solidity draft
- explain the contract structure
- create a manual review checklist
- organize the README and build log

AI did not make the final decisions about wallet safety, network selection, contract deployment, or whether the contract logic was appropriate.

## 4. Manual Judgments and Modifications

I manually judged that:

- I should use a course-only wallet.
- I should not submit private keys, seed phrases, API keys, access tokens, or `.env` files.
- The contract should include an `owner` field so only the creator can update a todo.
- The contract should reject empty todo content.
- Admin, payment, deletion, token, NFT, and external dependency logic should be excluded.
- Todo content is public onchain data and should not include private information.
- Remix VM testing is useful, but real submission requires Monad Testnet deployment and explorer verification.

## 5. Week 2 Direction

My Week 2 direction is:

```text
Research
```

More precisely:

```text
Research as the main direction, Tech as practice support, Ops as communication support.
```

My current research interest is onchain behavior and reputation: what an address-level action can actually prove, how to avoid confusing an address with a real person, and how AI agent task traces or other digital-subject behaviors might be recorded more honestly onchain.

## 6. Portfolio / Resume Sentence

```text
Built and deployed a minimal Onchain Todo smart contract on Monad Testnet, including AI-assisted Solidity drafting, manual contract review, Remix deployment, real read/write contract interactions, and explorer verification.
```

## 7. Week 2 Question

For Week 2, I want to explore:

```text
How can onchain records represent behavior or reputation without pretending that an address is the same as a real-world person?
```

One possible direction is AI Agent task traces, where the onchain subject is a digital agent or address rather than a human learner.

## 8. Safety

No private key, seed phrase, API key, access token, `.env` file, or real asset secret is included.

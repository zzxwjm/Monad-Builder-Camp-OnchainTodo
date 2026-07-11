# Week 1 Build Log 初稿

## 1. 本周完成了哪些链上实践

### 1.1 钱包与 Monad Testnet

本周我从零开始建立 Web3 基础操作环境：

- 创建课程专用 MetaMask 钱包。
- 添加 Monad Testnet。
- 使用课程专用钱包领取测试网 MON。
- 学习区分网络、原生代币和钱包地址。

课程钱包地址：

```text
0x2596976c6D2D5a301eFc3833e2749bDF368223e5
```

### 1.2 第一笔 Monad Testnet 转账

我完成了第一笔 Monad Testnet 测试网转账，并在 MonadVision 查看交易。

交易 hash：

```text
0xfcc719809d3984548a88305e8753d47539eb251fd800136a8c6bf24eeea441bd
```

Explorer：

```text
https://testnet.monadvision.com/tx/0xfcc719809d3984548a88305e8753d47539eb251fd800136a8c6bf24eeea441bd
```

交易信息：

- Status：`Success`
- From：`0x2596976c6D2D5a301eFc3833e2749bDF368223e5`
- To：`0xb11256348b1cba14E77Ca541A9b4a7E2Da2ecC49`
- Value：`0.01 MON`
- Transaction fee：`0.002162856067344 MON`

这一步让我第一次具体理解：交易不是普通网页按钮点击，而是一次由钱包签名、由链记录、可以被区块浏览器验证的状态改变。

### 1.3 AI 辅助生成 Solidity 合约

我使用 AI 辅助生成了一个最小 Solidity 合约：`OnchainTodo`。

合约功能：

- 创建 todo。
- 记录创建者地址。
- 记录 todo 内容。
- 标记是否完成。
- 读取 todo。
- 读取 todo 总数。

相关文件：

- 合约源码：`contracts/OnchainTodo.sol`
- AI 辅助开发提交文件：`notes/17-onchain-todo-final-submission.md`

### 1.4 Remix VM 编译与本地模拟测试

我先在 Remix VM 中完成编译、部署和基础功能测试。

测试路径：

```text
部署合约 -> 创建 todo -> 读取 todo 数量 -> 读取 todo 内容 -> 修改完成状态 -> 再次读取确认
```

这一步帮助我理解 Remix VM 和真实测试网的区别：Remix VM 是本地模拟环境，不是真实 Monad Testnet。

### 1.5 部署第一个合约到 Monad Testnet

我使用 Remix + MetaMask Browser Extension 将 `OnchainTodo` 部署到了 Monad Testnet。

合约地址：

```text
0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
```

部署交易 hash：

```text
0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
```

合约交互 transaction hash：

```text
0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

Explorer：

```text
https://testnet.monadvision.com/address/0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
https://testnet.monadvision.com/tx/0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
https://testnet.monadvision.com/tx/0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

Read function：

```text
getTodoCount()
getTodo(0)
```

`getTodo(0)` 返回：

```text
owner: 0x2596976c6D2D5a301eFc3833e2749bDF368223e5
content: Learn Solidity on Monad
completed: false
createdAt: 1783786512
updatedAt: 1783786512
```

Write function：

```text
createTodo("Learn Solidity on Monad")
```

这一步让我完整走通了：

```text
合约源码 -> 编译 -> 部署 -> 合约地址 -> read/write 调用 -> 区块浏览器验证
```

## 2. 本周遇到的问题

### 2.1 不理解为什么有很多链

一开始我觉得所有东西放在一条链上最方便。后来我开始用“不同公共世界 / 不同游戏”的方式理解不同链：

- 每条链有自己的规则。
- 每条链有自己的成本、速度和社区。
- 用户在某条链上操作，是因为想改变那条链里的状态。

### 2.2 不理解 blockchain state

因为我没有金融或计算机背景，`state` 一开始很抽象。

后来我把它理解成“一个系统当前的情况”：

- 余额是一种状态。
- NFT 所有权是一种状态。
- todo 是否完成是一种状态。
- 合约里保存的数据也是状态。

### 2.3 Codex 内置浏览器无法检测钱包

我在 Codex 内置浏览器里看到：

```text
No wallet detected. Please install a compatible wallet to continue
```

后来理解到：钱包交互需要在安装了 MetaMask 的 Chrome 里完成，Codex 内置浏览器没有 MetaMask 插件。

### 2.4 混淆网络、代币和地址

我曾经疑惑为什么接收地址里只有 MON，没有 Monad Testnet。

后来理解为：

```text
Monad Testnet = 网络
MON = 这个网络里的测试代币
接收地址 = 我要转给谁
```

### 2.5 Remix VM 和 Monad Testnet 的区别

我先在 Remix VM 中部署过合约，后来才真正部署到 Monad Testnet。

现在我理解：

- Remix VM 是本地模拟链。
- Browser Extension / MetaMask 才是连接真实测试网的方式。
- 真实部署会产生 Monad Testnet 上的交易 hash 和合约地址。

## 3. AI 帮我解决了什么

AI 主要在四个方面帮助我：

1. **概念解释**：把 Web3、链、交易、gas、state、钱包等概念翻译成我能理解的语言。
2. **学习记录**：帮助我把每日学习变成 notes、build log、changelog。
3. **合约初稿**：根据我的需求生成 `OnchainTodo` Solidity 合约。
4. **人工检查框架**：提醒我检查编译、函数、权限、复杂度、安全和命名。

例如，我最初给 AI 的 Prompt 是：

```text
现在我们开始这个项目吧。你之前已经向我解释过这个任务的需求了。现在请你先帮助我清晰地理解这个任务。然后我们一起做一个onchain Todo的demo
```

AI 帮我改进成更明确的合约需求：

- 使用 Solidity `^0.8.20`
- 用户可以创建 todo
- 记录创建者、内容、完成状态、时间
- 用户只能修改自己创建的 todo
- 不加入管理员、删除、付费或复杂权限
- 要求解释合约结构，方便人工检查

## 4. 哪些地方必须由我人工判断

AI 可以帮助生成初稿，但不能替我完成最终判断。

本周必须由我人工判断的地方包括：

- 是否使用课程专用钱包，而不是主力钱包。
- 是否确认 MetaMask 当前网络是 Monad Testnet。
- 是否确认没有提交私钥、助记词、API Key、`.env`。
- AI 生成的合约功能是否符合我想要的 demo。
- `owner` 权限检查是否必要。
- 是否要加入删除、管理员、付款等复杂逻辑。
- todo 内容是否适合公开上链。
- Remix VM 的成功是否不能等同于 Monad Testnet 部署成功。
- 部署后是否真的能在 MonadVision 找到合约和交易。

我现在的理解是：

> AI 可以提高学习速度，但链上操作、安全边界和最终判断必须由我自己负责。

## 5. 我对 Monad / Web3 的理解变化

### 5.1 从“Web3 = 炒币”到“Web3 = 可验证状态”

我一开始以为 Web3 主要是炒币和金融交易。

现在我更愿意把 Web3 理解成：

> 一套围绕状态、控制权、可验证性和信任结构展开的数字基础设施。

### 5.2 重新理解 transaction

我原来理解的交易是买卖。

现在我理解链上的 transaction 更像：

> 一个地址签名后，向某条链提交一次状态改变请求。

转账是状态改变，部署合约是状态改变，调用 `createTodo` 也是状态改变。

### 5.3 重新理解钱包

钱包不是“存钱工具”，而是：

> 控制地址、签名交易、进入链上世界的入口。

### 5.4 重新理解 Monad 的体验

通过部署和交互合约，我开始理解 Monad 不只是“更快”。

更准确地说，Monad 更适合承载需要频繁状态更新、低延迟反馈、并且又希望保留 EVM 工具链的应用。

我目前最感兴趣的方向是：

> 链上学习任务 / 打卡 / 排行榜系统。

这类产品需要频繁交互，但不是所有数据都应该上链。适合上链的是任务完成记录、badge、积分结算、排行榜结果等需要公开验证的关键状态；私人笔记、草稿、AI 对话内容应该留在普通数据库。

## 6. Tech / Ops / Research 分轨初步选择

我的初步选择是：

```text
Research 为主，Tech 为实践支撑，Ops 作为表达和社区传播辅助。
```

### 6.1 为什么不是纯 Tech

我已经完成了钱包、交易、合约生成、Remix 编译、Monad Testnet 部署和合约交互，但我仍然没有系统的 CS / Solidity / 前端工程基础。

Tech 对我来说很重要，但现阶段更适合作为实践工具：通过小 demo 理解概念，而不是马上走纯开发路线。

### 6.2 为什么不是纯 Ops

我愿意做表达、记录和社区传播，也能把学习过程写成清晰笔记。但我对 Web3 的理解还在建立中，单纯做传播容易变成概念复述。

Ops 可以作为辅助方向，帮助我把学习过程、产品想法和社区问题表达出来。

### 6.3 为什么更适合 Research

我的背景更接近研究、理论理解和问题拆解。我会自然关心：

- 链上行为到底代表什么？
- 哪些状态应该上链？
- 如何区分真实参与和刷量？
- badge、积分、排行榜是否真的代表贡献？
- 高频交互产品是否真的需要链上记录？

这些问题更接近 Research 方向，也和我心理测量 / 研究方法的背景更有连接。

但我不想只停留在抽象讨论，所以 Week 2 我希望采用：

```text
Research 问题意识 + Tech 小 demo 验证 + Ops 表达输出
```

## 7. 本周最重要的 1-3 个学习收获

### 收获 1：交易不是买卖，而是状态改变

我现在理解 transaction 是一次签名后的链上状态改变请求。转账、部署合约、调用 `createTodo` 都是 transaction。

### 收获 2：链上记录公开可验证，但不等于意义自动成立

链可以证明某个地址做过某个操作，但不能自动解释这个行为是否代表真实学习、真实贡献或真实参与。

### 收获 3：AI 可以辅助学习，但不能替代人工判断

AI 能帮我生成合约、解释代码、整理记录，但安全、权限、隐私、是否上链、是否符合需求，都必须由我自己判断。

## 8. 希望 Week 2 深入的方向

我希望 Week 2 深入：

> 面向学习社区的高频链上任务 / 打卡 / 排行榜系统。

可能的 demo 方向：

- 用户连接钱包。
- 创建或领取学习任务。
- 完成任务打卡。
- 写入公开完成记录。
- 读取个人任务状态。
- 生成 badge 或积分。
- 展示排行榜。

研究问题：

- 哪些学习行为值得上链？
- 哪些学习数据应该保留在普通数据库？
- badge / 积分 / 排行榜怎样避免只是刷量？
- Monad 的低延迟和高性能如何改善高频任务体验？

## 9. 希望助教或同伴帮助的问题

### 9.1 Web3 的 Research 方向具体在做什么？

我现在对 Research 的理解还比较模糊。它是更偏行业研究、协议研究、用户研究、机制设计、数据分析，还是产品策略？不同项目里的 Research 工作内容和产出形式分别是什么？

### 9.2 非 CS / 非金融背景进入 Web3 Research 是否有真实价值？

我的背景更偏心理测量、研究方法和学术训练，不是工程或交易出身。我想知道这种背景在 Web3 里可以贡献什么，哪些问题适合我切入，哪些方向又需要我补足技术或金融基础。

### 9.3 链上行为研究是否是一个有效切入点？

我对“链上记录到底代表什么”比较感兴趣。比如交易次数、任务完成、badge、投票、排行榜等链上行为，是否真的能代表参与、贡献或声誉？这个方向在 Web3 Research 中是否有实际需求？

### 9.4 Web3 的指标设计和激励机制研究是否有空间？

很多项目会用积分、badge、空投、排行榜、任务系统来激励用户。但这些指标可能被刷量、套利或误读。我想了解：如何研究一个指标是否有效？如何判断激励机制是否真的带来健康生态？

### 9.5 如果 Week 2 选择 Research 为主，我应该做什么样的小成果？

比如是写一份竞品 / 生态研究，分析一个高频交互场景，做一份链上行为指标框架，还是结合一个小 demo 来验证问题？我希望得到一个适合新手、但又不只是泛泛而谈的 Research 任务形式。

### 9.6 我当前最大的困惑

我能感觉到自己的研究训练让我会问“链上行为到底代表什么”“指标是否有效”“激励是否会扭曲行为”这类问题，但我还不知道这些问题在真实 Web3 项目中是否有需求，以及应该如何转化成具体产出。

## 10. 可提交链接或文件

- GitHub README：`README.md`
- Week 1 Build Log 初稿：`build-log/week-1-build-log-draft.md`
- Week 1 AI 合约生成提交：`notes/17-onchain-todo-final-submission.md`
- Monad 合约部署提交：`notes/18-monad-onchain-todo-deployment.md`
- Day 3 build log：`build-log/2026-07-12-day-3.md`

## 11. 安全说明

本周没有提交或保存：

- 私钥
- 助记词
- API Key
- access token
- `.env` 文件

所有链上任务均使用课程专用钱包完成。

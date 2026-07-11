# Week 1 - 智能合约实践 - 部署 Onchain Todo 到 Monad Testnet

## 任务理解

这个任务是把前一个任务中生成并检查过的最小 Solidity 合约真正部署到 Monad Testnet。

重点不是再写一个新合约，而是理解完整链路：

```text
合约源码 -> 编译 -> 连接课程钱包 -> 部署到 Monad Testnet -> 得到合约地址 -> 调用 read/write function -> 在区块浏览器验证
```

## 合约信息

- 合约名称：`OnchainTodo`
- 合约源码：`contracts/OnchainTodo.sol`
- 网络：`Monad Testnet`
- 部署工具：Remix 2.5.2
- 钱包：课程专用 MetaMask 钱包

## Monad Testnet 部署结果

### 合约地址

```text
0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
```

Explorer:

```text
https://testnet.monadvision.com/address/0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
```

### 部署交易 hash

```text
0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
```

Explorer:

```text
https://testnet.monadvision.com/tx/0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
```

## 合约交互结果

### Read function

调用 1：

```text
getTodoCount()
```

调用 2：

```text
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

说明：

`getTodoCount()` 和 `getTodo(0)` 都是 read function，只读取合约状态，不改变链上状态。因此它们通常不会产生 transaction hash。

### Write function

调用：

```text
createTodo(string)
```

交互交易 hash：

```text
0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

Explorer:

```text
https://testnet.monadvision.com/tx/0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

说明：

`createTodo(string)` 是 write function，会改变合约状态，因此会产生一笔 Monad Testnet transaction。

## README v0.1

README v0.1 已经整理在：

```text
README.md
```

其中包含：

- 合约功能说明
- Remix VM 本地验证结果
- Monad Testnet 部署地址
- 部署交易 hash
- 合约交互 transaction hash
- read / write function 说明
- 安全提醒

## 提交内容汇总

1. 合约地址：

```text
0xd6C8dB8621ceFB1660432C18BEA98C1cA60b5990
```

2. 部署交易 hash：

```text
0x0d3bcb9812dfce95060dba818fec471ae5f8bc66b7250d6e230d0a4342e30ea1
```

3. 至少一次合约交互 transaction hash：

```text
0x542f24db8b692eb636f7b1a2e523eccf1f870332c85fa38e4684d96342ed43ac
```

4. 合约部署或交互截图：

截图可使用 Remix 部署/交互页面，或 MonadVision 上的合约地址、部署交易、`createTodo` 交易页面。

5. README v0.1：

```text
README.md
```

## 我的理解

这次任务让我把智能合约从“本地模拟运行”推进到“真实测试网部署”。

我现在能更清楚地区分：

- 合约源码：写好的 Solidity 规则。
- 编译：把 Solidity 转成链可以部署的字节码。
- 部署交易：把合约发布到 Monad Testnet，得到一个合约地址。
- 合约地址：之后与这个合约交互的入口。
- read function：读取链上状态，不产生普通交易 hash。
- write function：改变链上状态，会产生 transaction hash。
- 区块浏览器：验证部署和交互是否真正发生。
- `getTodo(0)` 可以读回刚刚写入的 todo，说明合约状态已经被成功更新。

这条链路让我更具体地理解了：

```text
合约源码不是终点。部署、交互和验证才构成一次完整的链上实践。
```

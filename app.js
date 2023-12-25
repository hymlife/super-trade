const express = require("express");
const app = express();

app.use(express.json());

//including models
const db = require("./models");
const { parse } = require("dotenv");

//db connection with sequelize
db.sequelize.sync();

const Portfolio = db.portfolio;
const Share = db.share;
const Trade = db.trade;
const PortfolioShare = db.portfolioShare;

app.get("/", function (req, res) {
  res.json("Welceome to Super Trades");
});

app.post("/trades/buy", async (req, res) => {
  const { portfolioId, shareId, amount } = req.body;

  const portfolio = await Portfolio.findByPk(portfolioId);

  if (!portfolio)
    return res.status(400).send("Bad request: Portfolio not found");

  const share = await Share.findByPk(shareId);

  if (!share) return res.status(400).send("Bad request: Share not found");

  const balance =
    parseFloat(portfolio.balance) - amount * parseFloat(share.price);

  if (balance && balance < 0)
    return res.status(400).send("Bad request: Insufficient balance");

  await Trade.create({
    portfolioId: portfolioId,
    shareId: shareId,
    amount: amount,
    type: "BUY",
    shareId: shareId,
  });
  await Portfolio.update(
    { balance: balance },
    {
      where: {
        id: portfolioId,
      },
    }
  );
  const portfolioShare = await PortfolioShare.findOne({
    where: {
      portfolioId: portfolioId,
      shareId: shareId,
    },
  });
  if (
    portfolioShare &&
    portfolioShare.shareId == shareId &&
    portfolioShare.portfolioId == portfolioId
  ) {
    await PortfolioShare.update(
      { amount: portfolioShare.amount + amount },
      {
        where: {
          portfolioId: portfolioId,
          shareId: shareId,
        },
      }
    );
  } else {
    await PortfolioShare.create({
      portfolioId: portfolioId,
      shareId: shareId,
      amount: amount,
    });
  }

  res.send("Buy operation successful");
});

app.post("/trades/sell", async (req, res) => {
  const { portfolioId, shareId, amount } = req.body;

  const portfolio = await Portfolio.findByPk(portfolioId);
  if (!portfolio)
    return res.status(400).send("Bad request: Portfolio not found");

  const share = await Share.findByPk(shareId);
  if (!share) return res.status(400).send("Bad request: Share not found");

  const portfolioShare = await PortfolioShare.findOne({
    where: {
      portfolioId: portfolioId,
      shareId: shareId,
    },
  });

  if (!portfolioShare)
    return res.status(400).send("Bad request: Share not found in portfolio");

  if (portfolioShare.amount < amount)
    return res.status(400).send("Bad request: Insufficient shares");

  await PortfolioShare.update(
    { amount: portfolioShare.amount - amount },
    {
      where: {
        portfolioId: portfolioId,
        shareId: shareId,
      },
    }
  );

  await Trade.create({
    portfolioId: portfolioId,
    shareId: shareId,
    amount: amount,
    type: "SELL",
    shareId: shareId,
  });

  await Portfolio.update(
    {
      balance: parseFloat(portfolio.balance) + amount * parseFloat(share.price),
    },
    {
      where: {
        id: portfolioId,
      },
    }
  );

  res.send("Sell operation successful");
});

app.listen(3000, () => console.log("Server running on port 3000"));

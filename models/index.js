require("dotenv/config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(
  process.env.DB_DATABASE,
  process.env.DB_USERNAME,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_SERVER,
    dialect: "mysql",
    operatorsAliases: false,

    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000,
    },
  }
);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

//include db tables
db.user = require("./user.js")(sequelize, Sequelize);
db.portfolio = require("./portfolio.js")(sequelize, Sequelize);
db.share = require("./share.js")(sequelize, Sequelize);
db.trade = require("./trade.js")(sequelize, Sequelize);
db.portfolioShare = require("./portfolio_share.js")(sequelize, Sequelize);

/* associations db schema */
// user and portfolio
db.user.hasOne(db.portfolio, { foreignKey: "userId" });
db.portfolio.belongsTo(db.user, {
  foreignKey: "userId",
});

// portfolio and portfolioShare
db.portfolio.hasMany(db.portfolioShare, { foreignKey: "portfolioId" });
db.portfolioShare.belongsTo(db.portfolio, {
  foreignKey: "portfolioId",
});

// share and portfolioShare
db.share.hasMany(db.portfolioShare, { foreignKey: "shareId" });
db.portfolioShare.belongsTo(db.share, {
  foreignKey: "shareId",
});

// portfolio and trade sorunvar gibi
db.portfolio.hasMany(db.trade, { foreignKey: "portfolioId" });
db.trade.belongsTo(db.portfolio, {
  foreignKey: "portfolioId",
});

// share and trade
db.share.hasMany(db.trade, { foreignKey: "shareId" });
db.trade.belongsTo(db.share, {
  foreignKey: "shareId",
});

module.exports = db;

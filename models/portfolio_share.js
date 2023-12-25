module.exports = (sequelize, Sequelize) => {
  const portfolioShare = sequelize.define(
    "portfolio_share",
    {
      id: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      portfolioId: {
        type: Sequelize.INTEGER,
        validate: {
          notEmpty: {
            msg: "PortfolioID cannot be left blank",
          },
        },
        allowNull: false,
      },
      shareId: {
        type: Sequelize.INTEGER,
        validate: {
          notEmpty: {
            msg: "ShareID cannot be left blank",
          },
        },
        allowNull: false,
      },
      amount: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
      },
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
      },
    },
    {
      charset: "utf8",
      collate: "utf8_general_ci",
    }
  );

  return portfolioShare;
};

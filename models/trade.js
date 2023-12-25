module.exports = (sequelize, Sequelize) => {
  const trade = sequelize.define(
    "trade",
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
            msg: "UserID cannot be left blank",
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
      type: {
        type: Sequelize.STRING(4),
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

  return trade;
};

module.exports = (sequelize, Sequelize) => {
  const portfolio = sequelize.define(
    "portfolio",
    {
      id: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      userId: {
        type: Sequelize.INTEGER,
        validate: {
          notEmpty: {
            msg: "UserID cannot be left blank",
          },
        },
        allowNull: false,
      },
      balance: {
        type: Sequelize.FLOAT,
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

  return portfolio;
};

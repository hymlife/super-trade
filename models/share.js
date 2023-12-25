module.exports = (sequelize, Sequelize) => {
  const share = sequelize.define(
    "share",
    {
      id: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: Sequelize.STRING(50),
        allowNull: false,
      },
      shortnName: {
        type: Sequelize.STRING(3),
        allowNull: false,
      },
      price: {
        type: Sequelize.FLOAT(11),
        allowNull: false,
      },
      amount: {
        type: Sequelize.INTEGER(11),
        allowNull: false,
      },
      lastEdit: {
        type: Sequelize.DATE,
        allowNull: false,
      },
    },
    {
      charset: "utf8",
      collate: "utf8_general_ci",
    }
  );

  return share;
};

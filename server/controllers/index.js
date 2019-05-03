var models = require('../models');

module.exports = {
  messages: {
    get: function (req, res) {
      models.messages.get((err, results) => {
        if (err) {
          throw err;
        }
        res.json(results)
      })
    },
    post: function (req, res) {
      var params = [req.body.msg_body, req.body.user_name, req.body.room_name];
      models.messages.post(params, (err, results) => {
        res.sendStatus(201)
      })
    }
  },

  users: {
    // Ditto as above
    get: function (req, res) {
      models.users.get((err, results) => {
        if (err) {
          throw err;
        }
        res.json(results)
      })
    },

    post: function (req, res) {
      var params = [req.body.user_name];
      models.users.post(params, (err, results) => {
        res.sendStatus(201)
      })
    }
  }
};


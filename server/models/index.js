var db = require('../db');


module.exports = {
  messages: {
    get: function (callback) {
      var qStr = 'SELECT messages.id, messages.msg_body, \
                  messages.room_name, users.user_name FROM messages \
                  JOIN users ON (messages.user_id = users.id) \
                  order by messages.id desc'
      db.query(qStr, (err, result) => {
        if (err) {
          throw err;
        }else{
        callback(err, result);
        }
      })
    }, // a function which produces all the messages

    post: function (params, callback) {
      var qStr = 'INSERT INTO messages(msg_body, user_id, room_name)\
                  VALUES (?, (SELECT id FROM users WHERE user_name = ? LIMIT 1), ?)'
      db.query(qStr, params, (err, result) => {
        callback(err, result);
        }
      )
    } // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function (callback) {
      var qStr = 'SELECT * FROM users'
      db.query(qStr, (err, result) => {
       callback(err, result);
      })
    },

    post: function (params, callback) {
      var qStr = 'INSERT INTO users(user_name) VALUES (?)';
      db.query(qStr, params, (err, result) => {
        callback(err, result);
      })
    }
  }
};


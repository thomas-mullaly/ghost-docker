var path = require('path'),
    config;

config = {
  production: {
    url: process.env.GHOST_URL,

    server: {
      host: '0.0.0.0',
      port: '2368'
    },

    mail: {
        from: process.env.EMAIL_ADDRESS,
        transport: 'SMTP',
        options: {
            service: 'Gmail',
            auth: {
                user: process.env.EMAIL_ADDRESS,
                pass: process.env.EMAIL_PASSWORD
            }
        }
    },

    paths: {
      contentPath: path.join(process.env.GHOST_CONTENT, "/")
    }
  },

  development: {
    url: 'http://localhost:2368',

    database: {
      client: 'sqlite3',
      connection: {
        filename: path.join(process.env.GHOST_CONTENT, '/data/ghost-dev.db')
      },
      debug: false
    },

    server: {
      host: '0.0.0.0',
      port: '2368'
    },

    mail: {
        from: process.env.EMAIL_ADDRESS,
        transport: 'SMTP',
        options: {
            service: 'Gmail',
            auth: {
                user: process.env.EMAIL_ADDRESS,
                pass: process.env.EMAIL_PASSWORD
            }
        }
    },

    paths: {
      contentPath: process.env.GHOST_CONTENT
    }
  }
};

module.exports = config;

const startPage = (request, response) => {
    response.send({
        message: 'Welcome to the Node.js Express REST API!'
    });
}

module.exports = {
    startPage
}
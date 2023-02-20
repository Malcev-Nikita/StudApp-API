const connection = require('../models/db')


const getAllUser = (request, response) => {
    connection.query('SELECT * FROM users', (error, result) => {
        if (error) throw error;

        response.send(result);
    });
}

const getUserById = (request, response) => {
    const id = request.params.id;

    connection.query('SELECT * FROM users WHERE id = ?', id, (error, result) => {
        if (error) throw error;

        response.send(result);
    });
}

const postNewUser = (request, response) => {
    connection.query('INSERT INTO users VALUES ?', request.body, (error, result) => {
        if (error) throw error;

        response.status(201).send(`User added with ID: ${result.insertId}`);
    });
}

const putUserById = (request, response) => {
    const id = request.params.id;

    connection.query('UPDATE users SET ? WHERE id = ?', [request.body, id], (error, result) => {
        if (error) throw error;

        response.send('User updated successfully.');
    });
}

const deleteUserById = (request, response) => {
    const id = request.params.id;

    connection.query('DELETE FROM users WHERE id = ?', id, (error, result) => {
        if (error) throw error;
        response.send('User deleted.');
    });
}


module.exports = {
    getAllUser,
    getUserById,
    postNewUser,
    putUserById,
    deleteUserById
}
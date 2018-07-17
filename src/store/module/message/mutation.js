export default {
    SOCKET_CONNECT: (state, status) => {
        state.MESSAGE.connect = true;
    },
    SOCKET_USER_MESSAGE: (state, message) => {
        // console.log(message);
        state.MESSAGE.newMessage = true;
        state.MESSAGE.message = message;
    },
    CLEAR_NEW_MESSAGE: (state) => {
        state.MESSAGE.newMessage = false;
    }
}
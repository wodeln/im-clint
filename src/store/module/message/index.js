import mutations from './mutation';

const state = {
    MESSAGE:{
        connect: false,
        messages: new Map(),
        newMessage: false
    }
};

export default {
    mutations,
    state,
    getters: {
        userMessage: state => {
            // console.log(state.MESSAGE.messages);
            // console.log(333);
            return state.MESSAGE.messages;
        }
    }
};
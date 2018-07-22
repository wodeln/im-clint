export default {
    SOCKET_CONNECT: (state, status) => {
        state.MESSAGE.connect = true;
    },
    SOCKET_USER_MESSAGE: (state, messages) => {
        for(let message of messages){
            if(state.MESSAGE.messages.get(message.from_user_id)){
                // console.log(state.MESSAGE.messages.get(message.from_user_id));
                state.MESSAGE.messages.get(message.from_user_id).push(message);
            }else{
                let messageArr = [];
                messageArr.push(message)
                state.MESSAGE.messages.set(message.from_user_id,messageArr);
            }
            // state.MESSAGE.messages.push(message);
        }
    },
    RECEVIE_MESSAGE:(state,message)=>{
        if(state.MESSAGE.messages.get(message.from_user_id)){
            state.MESSAGE.messages.get(message.from_user_id).push(message);
        }else{
            let messageArr = [];
            messageArr.push(message)
            state.MESSAGE.messages.set(message.from_user_id,messageArr);
        }
    },
    CLEAR_NEW_MESSAGE: (state) => {
        state.MESSAGE.newMessage = false;
    },
    SEND_MESSAGE:(state,message)=>{
        if(state.MESSAGE.messages.get(message.to_user_id)){
            state.MESSAGE.messages.get(message.to_user_id).push(message);
        }else{
            let messageArr = [];
            messageArr.push(message)
            state.MESSAGE.messages.set(message.to_user_id,messageArr);
        }
    }
}
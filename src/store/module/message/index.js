import mutations from './mutation';

let m = new Map();
m.set(2,[{
    from_user_avatar:"/public/images/upload/xjj.jpg",
    from_user_id:3,
    from_user_nickname:"漂亮的小姐姐",
    message_content:"44444",
    message_group:5,
    to_user_avatar:"/public/images/upload/xgg.jpg",
    to_user_id:2,
    to_user_nickname:"隔壁老王"
}]);
m.set(3,[{
    from_user_avatar:"/public/images/upload/xjj.jpg",
    from_user_id:3,
    from_user_nickname:"漂亮的小姐姐",
    message_content:"44444",
    message_group:5,
    to_user_avatar:"/public/images/upload/xgg.jpg",
    to_user_id:2,
    to_user_nickname:"隔壁老王"
}]);
const state = {
    MESSAGE:{
        connect: false,
        messages: new Map(),
        newMessage: false,
        test:""
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
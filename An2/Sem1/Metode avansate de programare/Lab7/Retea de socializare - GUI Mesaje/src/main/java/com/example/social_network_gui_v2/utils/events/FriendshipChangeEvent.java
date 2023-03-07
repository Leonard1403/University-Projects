package com.example.social_network_gui_v2.utils.events;

import com.example.social_network_gui_v2.domain.Friendship;

public class FriendshipChangeEvent implements Event {
    private ChangeEventType type;
    private Friendship data, oldData;

    public FriendshipChangeEvent(ChangeEventType type, Friendship data){
        this.type = type;
        this.data = data;
    }

    public FriendshipChangeEvent(ChangeEventType type, Friendship data, Friendship oldData){
        this.type = type;
        this.data = data;
        this.oldData = oldData;
    }

    public ChangeEventType getType() {
        return type;
    }

    public Friendship getData() {
        return data;
    }

    public Friendship getOldData() {
        return oldData;
    }
}

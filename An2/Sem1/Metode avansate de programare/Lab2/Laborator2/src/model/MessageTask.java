//package ubb.scs.map.ir.seminar.taskrunner.model;
package model;

//import ubb.scs.map.ir.seminar.taskrunner.utils.Constants;
import utils.Constants;

import java.time.LocalDateTime;

public class MessageTask extends Task {

    private String message;
    private String from;
    private String to;
    private LocalDateTime date;

    public MessageTask(String taskId, String description, String message, String from, String to, LocalDateTime date) {
        super(taskId, description);
        this.message = message;
        this.from = from;
        this.to = to;
        this.date = date;
    }

    @Override
    public void execute() {
        System.out.println(toString());
    }

    @Override
    public String toString() {
        return super.toString() + " " + message + " " + from + " " + date.format(Constants.DATE_TIME_FORMATTER);
    }
}

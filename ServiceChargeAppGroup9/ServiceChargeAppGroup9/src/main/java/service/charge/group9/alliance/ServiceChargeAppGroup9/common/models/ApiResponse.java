package service.charge.group9.alliance.ServiceChargeAppGroup9.common.models;

import java.util.List;



public class ApiResponse {
	private enum Status {
        SUCCESS, ERROR
    }
    
	public Object data;
    public Status status;
    public String message;
    public int code;
    public String stackTrace;
    public List<String> messageList;

    
    public ApiResponse(Status status, Object model) {
        this.status = status;
        this.data = model;
    }
    
    public ApiResponse(Status status, Object model, String message) {
        this.status = status;
        this.data = model;
        this.message = message;
    }
    
    public ApiResponse(Status status, List<String> strMessage) {
        this.status = status;
        this.messageList = strMessage;
    }
    
    public static ApiResponse CreateSuccess(Object model) {
        return new ApiResponse(Status.SUCCESS, model);
    }
    
    
    public static ApiResponse CreateSuccess(Object model, String message) {
        return new ApiResponse(Status.SUCCESS, model, message);
    }
    
    public static ApiResponse CreateError(String... strMessage) {
        return new ApiResponse(Status.ERROR, strMessage);
    }
    
}

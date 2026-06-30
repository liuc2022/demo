package cmb.cmbchina.demo.infrastructure.common;

public enum ErrorCode {

    USER_ALREADY_EXISTS("USER_ALREADY_EXISTS", "User already exists"),
    VALIDATION_ERROR("VALIDATION_ERROR", "Validation failed"),
    INTERNAL_SERVER_ERROR("INTERNAL_SERVER_ERROR", "Internal server error");

    private final String code;
    private final String defaultMessage;

    ErrorCode(String code, String defaultMessage) {
        this.code = code;
        this.defaultMessage = defaultMessage;
    }

    public String getCode() {
        return code;
    }

    public String getDefaultMessage() {
        return defaultMessage;
    }
}


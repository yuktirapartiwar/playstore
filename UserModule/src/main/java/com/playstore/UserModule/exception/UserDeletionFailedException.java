package com.playstore.UserModule.exception;

public class UserDeletionFailedException extends RuntimeException {
    public UserDeletionFailedException(String message) {
        super(message);
    }
}

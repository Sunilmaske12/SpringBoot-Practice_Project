package com.sunil.SCM2.exception;

public class ResourceNotFoundException extends RuntimeException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ResourceNotFoundException() {
		super("Resouce not found");
	}
	
	public ResourceNotFoundException(String msg) {
		super(msg);
	}

}

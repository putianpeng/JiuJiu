package com.putian.domain;

import java.io.Serializable;

/**
 * @author putianpeng
 *
 */
public class Video extends Vpm implements Serializable {
	private static final long serialVersionUID = 1L;
	private String videoId;

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
}

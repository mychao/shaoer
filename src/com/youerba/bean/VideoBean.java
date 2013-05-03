package com.youerba.bean;

/**
 * 视频详情
 * @author mychao
 *
 */
public class VideoBean extends BaseBean{

	//id、name、score、category、update、播放次数、播放地址
	/**
	 * 评分,显示为4.5，实际存储为450，库内扩大100倍
	 */
	private int score;
	/**
	 * 分类id
	 */
	private int cateid;
	/**
	 * 更新时间
	 */
	private String updatetime;
	/**
	 * 观看次数
	 */
	private int visit;
	/**
	 * 播放地址
	 */
	private String playurl;
	
	/**
	 * 视频名称，如 猫和老鼠.mp4
	 */
	private String videoname;
	/**
	 * 视频截图
	 */
	private String imgurl;
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public String getPlayurl() {
		return playurl;
	}
	public void setPlayurl(String playurl) {
		this.playurl = playurl;
	}
	public String getVideoname() {
		return videoname;
	}
	public void setVideoname(String videoname) {
		this.videoname = videoname;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
}

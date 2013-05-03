package com.youerba.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.youerba.bean.CategoryBean;
import com.youerba.bean.VideoBean;
import com.youerba.util.FileUtils;
import com.youerba.util.TypeUtils;

public class ShaoerService {
	/**
	 * 
	 */
	public static final String TITLE = "儿童乐吧";
	
	/**
	 * 分类json文件
	 */
	private static final String CATEGORY_JSON_FILE = "category.json";
	/**
	 * 分类下视频,具体分类id将替换#标示
	 */
	private static final String VIDEO_CATEGORY_JSON_FILE_PREFIX = "cate_#.json";
	/**
	 * 所有分类集合
	 */
	private static List<CategoryBean> categorysCache = null;
	/**
	 * 所有视频集合
	 */
	private static Map<Integer, List<VideoBean>> videosCache = null;
	private static Map<String, List<VideoBean>> videosPageCache = null;
	public static Gson gson = new Gson();
	/**
	 * 数据存放根目录
	 */
	private static String DATA_PATH = Thread.currentThread().getContextClassLoader().getResource("").getFile()+"data/";
	
	private static ShaoerService instance;
	/**
	 * 私有构造函数
	 */
	private ShaoerService(){
		videosCache = new HashMap<Integer, List<VideoBean>>();
		videosPageCache = new HashMap<String, List<VideoBean>>();
		loadDataFromJson();
	}
	/**
	 * 单例
	 * @return
	 */
	public synchronized static ShaoerService getInstance(){
		if(instance == null){
			instance = new ShaoerService();
		}
		return instance;
	}
	/**
	 * 加载数据
	 */
	private void loadDataFromJson(){
		//init category data
		String json = FileUtils.readTxtFile(new File(DATA_PATH+CATEGORY_JSON_FILE));
		TypeToken<List<CategoryBean>> cateTypeToken = new TypeToken<List<CategoryBean>>(){};
		categorysCache = gson.fromJson(json, cateTypeToken.getType());
		TypeToken<List<VideoBean>> videoTypeToken = new TypeToken<List<VideoBean>>(){};
		List<VideoBean> videos = null;
		for(CategoryBean category: categorysCache){
			json = FileUtils.readTxtFile(new File(DATA_PATH + VIDEO_CATEGORY_JSON_FILE_PREFIX.replace("#", category.getId()+"")));
			videos = gson.fromJson(json, videoTypeToken.getType());
			videosCache.put(category.getId(), videos);
		}
	}
	/**
	 * 获取分类列表
	 * @return
	 */
	public List<CategoryBean> queryCategorys(int pageNow, int pageSize){
		return TypeUtils.querySubList(categorysCache, pageNow, pageSize);
	}
	/**
	 * 根据id获取分类信息
	 * @param id
	 * @return
	 */
	public CategoryBean queryById(int id){
		for(CategoryBean category: categorysCache){
			if(category.getId() == id){
				return category;
			}
		}
		return null;
	}
	/**
	 * 统计分类下视频总数
	 * @param categoryId
	 * @return
	 */
	public int statByCategoryId(int categoryId){
		int total = 0;
		List<VideoBean> videoList = videosCache.get(categoryId);
		if(videoList == null){
			return 0;
		}
		total = videoList.size();
		return total;
	}
	
	/**
	 * 获取分类下视频列表
	 * @param categoryId
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<VideoBean> queryByCategoryId(int categoryId, int pageNow, int pageSize){
		String key = "page_" + categoryId + "_" + pageNow;
		List<VideoBean> ret = videosPageCache.get(key);
		if(ret != null){
			return ret;
		}
		
		List<VideoBean> videos = videosCache.get(categoryId);
		if(videos == null || videos.size() < 1){
			return null;
		}
		ret = TypeUtils.querySubList(videos, pageNow, pageSize);
		//放入缓存
		if(ret != null && ret.size() > 0){
//			videosPageCache.put(key, ret);
		}
		return ret;
	}
	/**
	 * 根据id获取视频详情
	 * @param id
	 * @return
	 */
	public VideoBean queryForVideoById(int id){
		Collection<List<VideoBean>> collection = videosCache.values();
		Iterator<List<VideoBean>> it = collection.iterator();
		List<VideoBean> videoList = null;
		while(it.hasNext()){
			videoList = it.next();
			for(VideoBean video: videoList){
				if(video == null){
					continue;
				}
				if(id == video.getId()){
					return video;
				}
			}
		}
		return null;
	}
	
	/**
	 * 搜索缓存
	 */
	private static Map<String, List<VideoBean>> searchResultCache = new HashMap<String, List<VideoBean>>();
	/**
	 * 关键字搜索
	 * @param keywords
	 * @return
	 */
	public List<VideoBean> searchByName(String keywords){
		if(keywords == null || keywords.trim().equals("")){
			return null;
		}
		List<VideoBean> ret = searchResultCache.get(keywords);
		if(ret != null && ret.size() > 0){
			return ret;
		}
		ret = new ArrayList<VideoBean>();
		Collection<List<VideoBean>> collection = videosCache.values();
		Iterator<List<VideoBean>> it = collection.iterator();
		List<VideoBean> videoList = null;
		String tmp = "";
		while(it.hasNext()){
			videoList = it.next();
			for(VideoBean video: videoList){
				if(video == null || video.getName() == null){
					continue;
				}
				tmp = video.getName().toLowerCase();
				if(tmp.contains(keywords.toLowerCase())){
					ret.add(video);
				}
			}
		}
		if(ret.size() > 0){
			searchResultCache.put(keywords, ret);
		}
		return ret;
	}
	/**
	 * 根据不同页面获取不同的幻灯列表
	 * @param id
	 * @return
	 */
	public List<VideoBean> queryImagesScroll(int id){
		
		return null;
	}
	
	public static void main(String[] args){
		List<VideoBean> videos = ShaoerService.getInstance().queryByCategoryId(2, 200, 10);
		for(VideoBean video: videos){
			System.out.println(video.getCateid() + " " + video.getName() + " " + video.getUpdatetime() + " " + video.getPlayurl());
		}
	}
	
}

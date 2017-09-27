package com.ifan.book.utils;

import org.jetbrains.annotations.Contract;
import org.jetbrains.annotations.NotNull;

public class Invariable {
    /**
     * @author ifan
     * @version 0.0.1
     * @Date 2017年9月25日14:30:38
     * @explain 图书的状态
     */
    public static final int BOOK_STATE_NOT_AFFIRM = 0;//未确认状态

    public static final int BOOK_STATE_FLOW = 1;//流动状态
    public static final int BOOK_STATE_ONE_TO_ONE = 2;//一对一借阅状态
    public static final int BOOK_STATE_SELL = 3;//售出状态

    /**
     * @author ifan
     * @version 0.0.1
     * @Date 2017年9月25日14:30:38
     * @explain 用户的状态
     */
    public static final int USER_STATE_ADMIN = 0;//系统管理员
    public static final int USER_STATE_ORDINARY = 1;//普通用户
    public static final int USER_STATE_SHOOP = 2;//书店
    public static final int USER_STATE_LIBRARY = 3;//图书馆

    /**
     * @author ifan
     * @version 0.0.1
     * @Date 2017年9月25日14:30:38
     * @explain 借阅的状态
     */
    public static final int BORROW_HISTORY = 0;// 图书为历史记录
    public static final int BORROW_IN = 1;// 图书在该人的手中
    public static final int BORROW_NEXT = 2;// 下一位借阅人

    public static final float ACQUIESCENT_USER_INTEGRAL = 0.0F;//默认的用户积分
    public static final float ACQUIESCENT_BOOK_INTEGRAL = 0.0F;//默认的图书积分
    public static final String IMAGE_BOOK_PREFIX = "/book/resource/images/books/";//定义默认用户上传的路径前缀

    /**
     * @author ifan
     * @version 0.0.1
     * @Date 2017年9月25日14:30:38
     * @explain 定义关于地理位置的常量
     */
    public static final double POSITION_LONGITUDE = 117.276822;//默认的地理位置 经度
    public static final double POSITION_LATITUDE = 36.640457;//默认的地理位置 纬度
    public static final double POSITION_SCOPE = 0.000001;//默认的距离
    private static final double EARTH_RADIUS = 6378137;//地球平均半径
    public static final int DISTANCE_RADIUS = 100;// 定义默认的搜索半径

    //把经纬度转为度（°）
    @Contract(pure = true)
    private static double rad(double d) {
        return d * Math.PI / 180.0;
    }

    /**
     * 根据两点间经纬度坐标（double值），计算两点间距离，单位为米
     *
     * @param lng1 经度1
     * @param lat1 纬度1
     * @param lng2 经度2
     * @param lat2 纬度2
     * @return 两个点之间的距离
     */
    public static double getDistance(double lng1, double lat1, double lng2, double lat2) {
        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lng1) - rad(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        return s;
    }

    /**
     * 根据提供的经度和纬度、以及半径，取得此半径内的最大最小经纬度
     * @param latitude 确定的经度
     * @param longitude 确定的纬度
     * @param radius 半径(米)
     * @return
     */
    @NotNull
    public static double[] getAround(double latitude, double longitude, int radius) {

        double degree = (24901 * 1609) / 360.0;

        double radiusLat = (1 / degree) * radius;
        double minLat = latitude - radiusLat;
        double maxLat = latitude + radiusLat;

        double mpdLng = degree * Math.cos(latitude * (Math.PI / 180));
        double radiusLng = (1 / mpdLng) * radius;
        double minLng = longitude - radiusLng;
        double maxLng = longitude + radiusLng;
        return new double[]{minLat, minLng, maxLat, maxLng};
    }

    // 定义 session 和 cookie 使用的存储用户的key
    public static final String SESSION_KEY = "login_session_user";
    public static final String COOKIE_KEY = "login_cookie_user";


}

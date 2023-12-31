package com.buct.spider.codeforces;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.buct.spider.entity.*;
import com.buct.spider.mapper.CiMapper;
import com.buct.spider.mapper.CodeforcesMapper;
import com.buct.spider.mapper.StudentMapper;
import com.buct.spider.util.HttpRequest;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class GetCfData {

    @Resource
    private StudentMapper studentMapper;
    @Resource
    private CodeforcesMapper codeforcesMapper;

    @Resource
    private CiMapper ciMapper;

    /**
     * 获取cf比赛数据，cf数据为json格式返回，不需要解析html页面
     */
    public void getInfo(){
        List<Student> students = studentMapper.selectList(null);
        for (int i = 0; i < students.size(); i++) {
            String id = students.get(i).getStuCfId();
            if(id!=null && !id.equals("")){
                //获取json数据
                String data = HttpRequest.sendGet("https://codeforces.com/api/user.rating?handle=" + id);
                JSONObject jsonObject = JSONObject.parseObject(data);
                if(jsonObject==null)continue;
                JSONArray result = jsonObject.getJSONArray("result");
                if(result.size()!=0){
                    JSONObject newOne = result.getJSONObject(result.size()-1);
                    //封装成codeforces对象
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Codeforces codeforces = new Codeforces();
                    codeforces.setCfId(newOne.getString("handle"));
                    codeforces.setCfContestId(newOne.getString("contestId"));
                    String ratingUpdateTimeSeconds = simpleDateFormat.format(new Date(newOne.getLong("ratingUpdateTimeSeconds")*1000));
                    codeforces.setCfDate(ratingUpdateTimeSeconds);
                    codeforces.setCfNewRating(newOne.getString("newRating"));
                    codeforces.setCfRank(newOne.getString("rank"));
                    codeforces.setCfContest(newOne.getString("contestName"));
                    codeforces.setCfSumContest(String.valueOf(result.size()));
                    codeforces.setCfOldRating(newOne.getString("oldRating"));
                    //存入数据库中
                    QueryWrapper<Codeforces> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("cf_id",codeforces.getCfId());
                    Codeforces exist = codeforcesMapper.selectById(codeforces.getCfId());
                    if(exist==null){
                        codeforcesMapper.insert(codeforces);
                    }else {
                        codeforcesMapper.update(codeforces,queryWrapper);
                    }
                }
            }
        }
    }
   /* public void getlist(){
        String data=HttpRequest.sendGet("https://codeforces.com/api/contest.list?gym=true");
        JSONObject dataJsonobject=JSONObject.parseObject(data);
        JSONArray result = dataJsonobject.getJSONArray("result");
        for(int i=0;i<result.size();i++) {
            JSONObject contestJson = result.getJSONObject(i);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String contestPlatform="CF";
            String contestName=contestJson.getString("name");
            String contestLink="https://codeforces.com/contest/"+contestJson.getString("id");



            String contestStartTimeSeconds = simpleDateFormat.format(new Date(contestJson.getLong("startTimeSeconds") * 1000));
            Integer contestStartingTime = contestJson.getInteger("startTimeSeconds");
            Integer contestClosingTime=contestJson.getInteger("durationSeconds");
            Integer durationSeconds = contestJson.getInteger("durationSeconds");
            Integer hour = durationSeconds / 60 / 60;
            Integer minutes = durationSeconds / 60 % 60;
            Integer seconds = durationSeconds % 60;
            String contestDurationSeconds = hour+":"+minutes+":"+seconds;
            Integer contestRelativeTimeSeconds = contestJson.getInteger("relativeTimeSeconds");
            Integer contestParticipantsnumber = 0;


            Ci ci=new Ci();
            ci.setPlatform(contestPlatform);
            ci.setLink(contestLink);
            ci.setName(contestName);
            ci.setStartingTime(contestStartingTime);
            ci.setStartingTime(ClosingTime);

            QueryWrapper<Ci> queryWrapper = new QueryWrapper<>();

            Ci exist = ciMapper.selectOne(queryWrapper);
            if(exist==null){
                ciMapper.insert(ci);
            }else {
                ciMapper.update(ci,queryWrapper);
            }

        }

    }*/
    public void getlist() {
        String data = HttpRequest.sendGet("https://codeforces.com/api/contest.list?gym=false");
        JSONObject jsonObject = JSONObject.parseObject(data);
        JSONArray result = jsonObject.getJSONArray("result");

// 遍历竞赛列表
        for(int i = 0; i < result.size(); i++) {
            JSONObject contestJson = result.getJSONObject(i);

// 解析竞赛数据
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String contestPlatform="CF";
            String contestId = "https://codeforces.com/api/contest"+contestJson.getString("id");
            String contestName = contestJson.getString("name");
            String contestStartTimeSeconds = simpleDateFormat.format(new Date(contestJson.getLong("startTimeSeconds") * 1000));
            Integer durationSeconds = contestJson.getInteger("durationSeconds");
            Integer hour = durationSeconds / 60 / 60;
            Integer minutes = durationSeconds / 60 % 60;
            Integer seconds = durationSeconds % 60;
            String contestDurationSeconds = hour+":"+minutes+":"+seconds;
            Integer contestRelativeTimeSeconds = contestJson.getInteger("relativeTimeSeconds");
            String contestClosingTime=simpleDateFormat.format(new Date((contestJson.getLong("durationSeconds")+contestJson.getLong("startTimeSeconds"))* 1000));


// 创建竞赛对象并设置数据
            Ci ci=new Ci();
            ci.setName(contestName);
            ci.setStartingTime(contestStartTimeSeconds);
            ci.setClosingTime(contestClosingTime);
            ci.setLink(contestId);
            ci.setPlatform(contestPlatform);

// 存入数据库
            QueryWrapper<Ci> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("starting_time", contestStartTimeSeconds);
            Ci exist = ciMapper.selectOne(queryWrapper);
            if(exist==null){
                ciMapper.insert(ci);
            }else {
               ciMapper.update(ci,queryWrapper);
            }

        }
    }

}

package com.buct.spider.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author BUCT
 * @since 2023-07-16
 */
@Getter
@Setter
public class Ci implements Serializable {

    private static final long serialVersionUID = 1L;

    private String platform;

    private String name;

    private String link;

    @TableId(value = "starting_time", type = IdType.INPUT)
    private String startingTime;

    private String closingTime;


}

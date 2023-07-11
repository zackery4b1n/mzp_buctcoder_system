package com.buct.acmer.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author BUCT
 * @since 2023-07-11
 */
@Getter
@Setter
@ApiModel(value = "Test对象", description = "")
public class Test implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "stu_no", type = IdType.INPUT)
    private String stuNo;


}

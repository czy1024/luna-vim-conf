##定义初始变量
#set($tableName = $tool.append($tableInfo.name, "Mapper"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/mapper"))

##拿到主键
#if(!$tableInfo.pkColumn.isEmpty())
    #set($pk = $tableInfo.pkColumn.get(0))
#end

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}mapper;

import $!{tableInfo.savePackageName}.entity.$!{tableInfo.name};
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import javax.validation.constraints.*;
import java.util.List;
/**
@Author: ${author}
@CreateTime: ${time.currTime("yyyy-MM-dd HH:mm:ss")}
*/
@Mapper
public interface $!{tableName} {

    /**
     * 通过主键查询数据
     *
     * @param $!pk.name 主键
     * @return 对象
     */
    $!{tableInfo.name} getById(@NotNull $!pk.shortType $!pk.name);

    /**
     * 通过实体不为空的属性作为筛选条件查询单个
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 条件
     * @return 对象
     */
    $!{tableInfo.name} getByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));

    /**
     * 通过实体不为空的属性作为筛选条件查询列表
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 条件
     * @return 对象列表
     */
    List<$!{tableInfo.name}> listByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));
    
    /**
     * 通过Id列表作为筛选条件查询列表，列表长度不为0
     *
     * @param list 列表
     * @return 对象列表
     */
    List<$!{tableInfo.name}> listByIds(@NotEmpty List<$!pk.shortType> list);

    /**
     * 新增实体属性不为null的列
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 实例
     * @return 影响行数
     */
    int insert(@NotNull $!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));

    /**
     * 批量新增所有列，列表长度不能为0，且列表id统一为null或者统一不为null
     *
     * @param list 实例
     * @return 影响行数
     */
    int insertBatch(@NotEmpty List<$!{tableInfo.name}> list);

    /**
     * 通过主键修改实体属性不为null的列
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 实例
     * @return 影响行数
     */
    int update(@NotNull $!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));

    /**
     * 通过表字段修改实体属性不为null的列
     *
     * @param where 条件
     * @param where set
     * @return 影响行数
     */
    int updateByField(@NotNull @Param("where") $!{tableInfo.name} where, @NotNull @Param("set") $!{tableInfo.name} set);

    /**
     * 通过主键修改实体列表，列表长度不能为0，注意：当实体属性为null时，对应的列也会别更新为null
     *
     * @param list 列表
     * @return 影响行数
     */
    int updateBatch(@NotEmpty List<$!{tableInfo.name}> list);

    /**
     * 通过主键删除
     *
     * @param $!pk.name 主键
     * @return 影响行数
     */
    int deleteById(@NotNull $!pk.shortType $!pk.name);

    /**
     * 通过实体非空属性删除
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 实体
     * @return 影响行数
     */
    int deleteByEntity(@NotNull $!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));
  
    /**
     * 通过主键列表删除，列表长度不能为0
     *
     * @param list 列表
     * @return 影响行数
     */
    int deleteByIds(@NotEmpty List<$!pk.shortType> list);
    
    /**
     * 查询行数
     *
     * @return 影响行数
     */
    int countAll();

    /**
     * 通过实体非空查询行数
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 实体
     * @return 影响行数
     */
    int countByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));
    
}

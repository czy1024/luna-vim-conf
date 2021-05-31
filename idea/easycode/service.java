##定义初始变量
#set($tableName = $tool.append($tableInfo.name, "Service"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/service"))

##拿到主键
#if(!$tableInfo.pkColumn.isEmpty())
    #set($pk = $tableInfo.pkColumn.get(0))
#end

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}service;

import $!{tableInfo.savePackageName}.mapper.$!{tableInfo.name}Mapper;
import $!{tableInfo.savePackageName}.entity.$!{tableInfo.name};
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
@Author: ${author}
@CreateTime: ${time.currTime("yyyy-MM-dd HH:mm:ss")}
*/
public interface $!{tableName} {
   
    /**
     * 通过主键查询数据
     *
     * @param $!pk.name 主键
     * @return 对象
     */
    $!{tableInfo.name} getById($!pk.shortType $!pk.name);

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
     * 条件分页查询
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 查询条件
     * @param page 起始标号
     * @param pageSize 查询条目
     * @return 对象列表
     */
    PageInfo<$!{tableInfo.name}> listPageByEntity(int page, int pageSize, $!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));

    /**
     * 条件分页查询
     *
     * @param page 起始标号
     * @param pageSize 查询条目
     * @return 对象列表
     */
    PageInfo<$!{tableInfo.name}> listPage(int page, int pageSize);

    /**
     * Id列表查询对象列表
     *
     * @param ids Id列表
     * @return 对象列表
     */
    List<$!{tableInfo.name}> listByIds(List<$!pk.shortType> ids);

    /**
     * 插入
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 对象
     * @return 影响行数
     */
    int insert($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));

    /**
     * 列表插入
     *
     * @param list 列表对象
     * @return 影响行数
     */
    int insertBatch(List<$!{tableInfo.name}> list);

    /**
     * 更新
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 对象
     * @return 影响行数
     */
    int update($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));

    /**
     * 列表更新
     *
     * @param list 列表对象
     * @return 影响行数
     */
    int updateBatch(List<$!{tableInfo.name}> list);

    /**
     * 删除
     *
     * @param $!pk.name 主键
     * @return 影响行数
     */
    int deleteById($!pk.shortType $!pk.name);

    /**
     * 条件删除
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 对象
     * @return 影响行数
     */
    int deleteByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));
 
     /**
     * 主键列表删除
     *
     * @param list 主键列表
     * @return 影响行数
     */ 
    int deleteByIds(List<$!pk.shortType> list);
    
     /**
     * 数据条目
     *
     * @return 影响行数
     */ 
    int countAll();

    /**
     * 条件查询数目
     *
     * @param $!tool.firstLowerCase($!{tableInfo.name}) 对象
     * @return 影响行数
     */
    int countByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name}));
}

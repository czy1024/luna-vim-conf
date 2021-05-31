##定义初始变量
#set($tableName = $tool.append($tableInfo.name, "ServiceImpl"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/service/impl"))

##拿到主键
#if(!$tableInfo.pkColumn.isEmpty())
    #set($pk = $tableInfo.pkColumn.get(0))
#end

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}service.impl;

import $!{tableInfo.savePackageName}.mapper.$!{tableInfo.name}Mapper;
import $!{tableInfo.savePackageName}.service.$!{tableInfo.name}Service;
import $!{tableInfo.savePackageName}.entity.$!{tableInfo.name};
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.util.Date;
import java.util.List;

/**
@Author: ${author}
@CreateTime: ${time.currTime("yyyy-MM-dd HH:mm:ss")}
*/
@Service
public class $!{tableName} implements $!{tableInfo.name}Service {

    @Autowired
    private $!{tableInfo.name}Mapper $!tool.firstLowerCase($!{tableInfo.name})Mapper;

    @Override
    public $!{tableInfo.name} getById($!pk.shortType $!pk.name) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.getById($!{pk.name});
    }

    @Override
    public $!{tableInfo.name} getByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.getByEntity($!{tool.firstLowerCase($!{tableInfo.name})});
    }

    @Override
    public List<$!{tableInfo.name}> listByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.listByEntity($!{tool.firstLowerCase($!{tableInfo.name})});
    }
    
    @Override
    public PageInfo<$!{tableInfo.name}> listPageByEntity(int page, int pageSize, $!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        PageHelper.startPage(page,pageSize);
        List<$!{tableInfo.name}> list = $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.listByEntity($!{tool.firstLowerCase($!{tableInfo.name})});
        return new PageInfo<$!{tableInfo.name}>(list);
    }
    
    @Override
    public PageInfo<$!{tableInfo.name}> listPage(int page, int pageSize) {
        PageHelper.startPage(page,pageSize);
        List<$!{tableInfo.name}> list = $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.listByEntity(new $!{tableInfo.name}());
        return new PageInfo<$!{tableInfo.name}>(list);
    }

    @Override
    public List<$!{tableInfo.name}> listByIds(List<$!pk.shortType> ids) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.listByIds(ids);
    }

    @Override
    public int insert($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.insert($!{tool.firstLowerCase($!{tableInfo.name})});
    }
   
    @Override
    public int insertBatch(List<$!{tableInfo.name}> list) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.insertBatch(list);
    }

    @Override
    public int update($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.update($!{tool.firstLowerCase($!{tableInfo.name})});
    }

    @Override
    public int updateBatch(List<$!{tableInfo.name}> list) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.updateBatch(list);
    }

    @Override
    public int deleteById($!pk.shortType $!pk.name) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.deleteById($!pk.name);
    }

    @Override
    public int deleteByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.deleteByEntity($!{tool.firstLowerCase($!{tableInfo.name})});
    }
  
    @Override
    public int deleteByIds(List<$!pk.shortType> list) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.deleteByIds(list);
    }

    @Override
    public int countAll() {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.countAll();
    }
    
    @Override
    public int countByEntity($!{tableInfo.name} $!tool.firstLowerCase($!{tableInfo.name})) {
        return $!{tool.firstLowerCase($!{tableInfo.name})}Mapper.countByEntity($!tool.firstLowerCase($!{tableInfo.name}));
    }

}

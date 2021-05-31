##定义初始变量
#set($tableName = $tool.append($tableInfo.name, "Controller"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/controller"))
##拿到主键
#if(!$tableInfo.pkColumn.isEmpty())
    #set($pk = $tableInfo.pkColumn.get(0))
#end

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}controller;

import $!{tableInfo.savePackageName}.entity.$!{tableInfo.name};
import $!{tableInfo.savePackageName}.service.$!{tableInfo.name}Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

/**
@Author: ${author}
@CreateTime: ${time.currTime("yyyy-MM-dd HH:mm:ss")}
*/
@RestController
@RequestMapping("/$!tool.firstLowerCase($tableInfo.name)/api")
public class $!{tableName} {
    
    @Autowired
    private $!{tableInfo.name}Service $!tool.firstLowerCase($tableInfo.name)Service;

    @GetMapping("/get/{$!pk.name}")
    public ResultDTO<$!{tableInfo.name}> getById(@PathVariable(value = "$!pk.name") $!pk.shortType  $!pk.name ) {
        $tableInfo.name $!tool.firstLowerCase($tableInfo.name) = $!{tool.firstLowerCase($tableInfo.name)}Service.getById(id);
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!tool.firstLowerCase($tableInfo.name)!=null?$!tool.firstLowerCase($tableInfo.name) : null);
    }

    @GetMapping("/get")
    public ResultDTO<$!{tableInfo.name}> getByEntity($tableInfo.name $!tool.firstLowerCase($tableInfo.name)) {
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}Service.getByEntity($!{tool.firstLowerCase($!{tableInfo.name})}));
    }

    @GetMapping("/list")
    public ResultDTO<List<$!{tableInfo.name}>> list($tableInfo.name $!tool.firstLowerCase($tableInfo.name)) {
        List<$tableInfo.name> $!{tool.firstLowerCase($tableInfo.name)}List = $!{tool.firstLowerCase($tableInfo.name)}Service.listByEntity($!{tool.firstLowerCase($!{tableInfo.name})});
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}List);
    }
    
    @GetMapping("/pageListByEntity/{page}/{size}")
    public ResultDTO<PageInfo<$tableInfo.name>> listPageByEntity(@PathVariable(value = "page")int page, @PathVariable(value = "size")int size, $tableInfo.name $!tool.firstLowerCase($tableInfo.name)) {
        PageInfo<$tableInfo.name> pageInfo = $!{tool.firstLowerCase($tableInfo.name)}Service.listPageByEntity(page, size, $!{tool.firstLowerCase($!{tableInfo.name})});
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, pageInfo);
    }
    
    @GetMapping("/pageList/{page}/{size}")
    public ResultDTO<PageInfo<$tableInfo.name>> listPage(@PathVariable(value = "page")int page, @PathVariable(value = "size")int size) {
        PageInfo<$tableInfo.name> pageInfo = $!{tool.firstLowerCase($tableInfo.name)}Service.listPage(page, size);
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, pageInfo);
    }

    @PostMapping("/insert")
    public ResultDTO<$tableInfo.name> insert(@RequestBody $tableInfo.name $!tool.firstLowerCase($tableInfo.name)){
        $!{tool.firstLowerCase($tableInfo.name)}Service.insert($!tool.firstLowerCase($tableInfo.name));
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!tool.firstLowerCase($tableInfo.name));
    }
    
    @PostMapping("/insertBatch")
    public ResultDTO<List<$tableInfo.name>> insert(@RequestBody List< $tableInfo.name> list){
        $!{tool.firstLowerCase($tableInfo.name)}Service.insertBatch(list);
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, list);
    }

    @PutMapping("/update")
    public ResultDTO<Boolean> update(@RequestBody $tableInfo.name $!tool.firstLowerCase($tableInfo.name)){
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}Service.update($!tool.firstLowerCase($tableInfo.name))==1);
    }
    
    @PutMapping("/updateBatch")
    public ResultDTO<Boolean> update(@RequestBody List<$tableInfo.name> list){
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}Service.updateBatch(list) == list.size());
    }

    @DeleteMapping("/delete/{$!pk.name}")
    public ResultDTO<Boolean> deleteOne(@PathVariable(value = "$!pk.name") $!pk.shortType $!pk.name){
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}Service.deleteById($!pk.name)==1);
    }
    
    @DeleteMapping("/deleteByEntity")
    public ResultDTO<Boolean> deleteOne(@RequestBody $tableInfo.name $!tool.firstLowerCase($tableInfo.name)){
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}Service.deleteByEntity($!tool.firstLowerCase($tableInfo.name)) == 1);
    }

    @DeleteMapping("/delete")
    public ResultDTO<Integer> deleteBatch(@RequestBody List<$!pk.shortType> $!{pk.name}s){
        int result = 0;
        if ($!{pk.name}s!=null&&$!{pk.name}s.size()>0){ 
            result = $!{tool.firstLowerCase($tableInfo.name)}Service.deleteByIds($!{pk.name}s);
        }
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, result);
    }

    @GetMapping("/account")
    public ResultDTO<Integer> getAccount() {
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS, $!{tool.firstLowerCase($tableInfo.name)}Service.countAll());
    }

    @GetMapping("/accountByEntity")
    public ResultDTO<Integer> getAccountByEntity($tableInfo.name $!{tool.firstLowerCase($tableInfo.name)}) {
        return new ResultDTO<>(true, ResultCode.SUCCESS, ResultCode.MSG_SUCCESS,
            $!{tool.firstLowerCase($tableInfo.name)}Service.countByEntity($!{tool.firstLowerCase($tableInfo.name)}));
    }
}

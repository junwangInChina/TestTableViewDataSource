TestTableViewDataSource
=======================

定制表格 DataSource，简化表格流程。将表格的 DataSource 单独定制，可复用性强。主要代码为:
```
    self.cusDatasource = [[CUSTableDataSource alloc] initWithItems:array
                                                    cellIdentifier:mainIdentifier
                                                    configureBlock:^(MainCell *cell, MainModel *model)
    {
        [cell setModel:model];
    }];
```
该 DataSource 将表格的 DataSource方法单独提取出来封装，简单易用。
```
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifierString
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell,item);
    return cell;
}
```

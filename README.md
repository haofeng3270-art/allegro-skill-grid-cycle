# Allegro Grid Cycle

[English](README.en.md)

Cadence Allegro PCB Editor 的 SKILL 脚本：按 **G** 循环切换栅格 **1 → 5 → 10 → 20 → 1 mil**。首次按 G 设置为 1 mil。

## 安装和使用

1. 下载 `grid_cycle.il`，放到固定位置，例如 `C:/allegro-skill/grid_cycle.il`。
2. 打开 Allegro PCB Editor 和一个设计，在 Allegro 命令行输入（将路径替换为实际路径）：

   ```text
   skill load("C:/allegro-skill/grid_cycle.il")
   ```

3. 将焦点放在画布，按 G 切换。命令行会显示设置结果。

如需启动时自动加载，在用户 `pcbenv/allegro.ilinit` 中追加（保留原有内容）：

```lisp
load("C:/allegro-skill/grid_cycle.il")
```

重新启动 Allegro。脚本加载时会覆盖当前会话中的 G 快捷键；删除自动加载行并重启即可停用。请检查自己的 `pcbenv/env` 中是否有原有的 G 键绑定。

## 行为和限制

- 同时设置 Non-Etch 和所有 Etch 层的 X/Y 间距，保留各层原点，但会统一原来不同的栅格间距。栅格设置无法通过 Undo 撤销。
- 按图纸单位换算 mil；若设置失败，请检查命令行提示、图纸单位和 Drawing Parameters 精度。
- 如果 Grids 对话框在切换时打开，它不会自动刷新；关闭后重新打开查看。
- 接口已对照 Allegro 17.4 的本机 SKILL 文档编写，尚未完成 Allegro 实际运行验证。不同版本、布线等活动命令期间的快捷键行为需要自行验证。

## License

[MIT](LICENSE)

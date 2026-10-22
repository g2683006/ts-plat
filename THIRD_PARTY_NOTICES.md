# 第三方文件说明

`src/main/webapp` 里放了下面这些第三方文件。它们不属于本项目，版权归原作者，按各自的许可证使用。

| 文件 | 项目 | 版本 | 许可证 |
| --- | --- | --- | --- |
| `js/jquery-3.4.1.js`、`js/jquery-3.4.1.min.js`、`js/jquery.min.js` | [jQuery](https://jquery.com/) | 3.4.1 | MIT |
| `css/bootstrap*.css`、`js/bootstrap.min.js` | [Bootstrap](https://getbootstrap.com/) | 3.4.1 | MIT |
| `layui/` | [layui](https://github.com/layui/layui) | 2.4.5 | MIT |
| `kindeditor/` | [KindEditor](http://kindeditor.net/) | 4.1.11 | 见 <http://kindeditor.net/license.php>（文件头里的声明） |
| `WEB-INF/*.tld` | JSTL 标签库描述文件（Apache Standard Taglib） | 1.x | Apache License 2.0 |

另外，`jsp/answer.jsp`、`jsp/student_quiz.jsp`、`jsp/student_subject.jsp` 会在运行时从 `code.jquery.com` 加载 jQuery 3.0.0（MIT）。

MIT 许可证要求在分发时保留版权声明；上面这些文件的头部注释里都带着原始的版权声明，请不要删除。

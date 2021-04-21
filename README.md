Trinity使用過程之筆記

**--20210407上課筆記**
1.刪除Category時要注意，如果底下有一個JOB以上，就不可以做刪除。JOB做刪除時，要先Release Lock，才可以先刪除JOB，做到全部的JOB清空之後，才可以刪除Category。

2.地址正規化處理的部分，可以在輸入地址之後，讓他自動轉成經緯度。

3.virtual agent雖然很好用，但是有個問題，當virtual agent有好幾台，但他們的OS不同，指派的工作會不一樣，當他們的工作內容忙碌時，恐怕無法執行。

/*Job Designer部分功能說明*/
一、Retry Option
1.Retry Mode : 
(1)From Beginning：從頭開始執行。
(2)From Breakpoint：從中斷點開始執行。

二、Time Window

三、TXDATE
(1)TXDATE Rule
例如：Offset Date：系統日期減掉的時間。減掉的幅度見右方的TXDATE Offset。

四、Priority
(1)Bypass Error：若有錯誤訊息，可決定是否忽略的動作。
(2)Critical Job：最大、最優先的執行權。注意：當這個方框被打勾後，一次只會執行一個Job。不需要每個Job都執行critical job。避免系統資源的浪費。

五、Task Attribute(以下選項視情況決定是否勾選)
(1)skip missing task：檢查該時間點以前是否有漏掉執行的作業。若有，他才會補跑。
(2)Only Apply Completed Task：
(3)Don't Save History：此步驟適用於大量執行步驟的時候使用。

**--20210421**
/*在trinity上面執行windows cmd指令*/
在trinity上面，要看當時安裝在trinity上面的作業系統(簡稱OS)是什麼，就要在上面寫哪一種指令。

以本例子為例，trinity是在windows server底下，需要設定的過程如下：
![](https://i.imgur.com/ow8VZsR.jpg)

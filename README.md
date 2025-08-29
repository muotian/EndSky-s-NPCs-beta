# 末天的恩批吸-beta

**適用版本:** java-1.20.2~1.21.8 (使用原版資料包內建的「覆蓋」功能實現，不保證能與任何的伺服器插件或模組相容)  

歡迎使用末天的恩批吸，此資料包如其名，是一個幫你處理NPC的資料包。  

> 那為什麼還有一個beta在後面?

那是因為目前這個資料包內的所有功能原本都是為了我與他人合作的一個專案所設計的，受人建議才獨立公開出來讓大家使用。你在裡面很有可能找不到你想要的功能，以一個工具資料包的標準來說實在是不夠合格，所以就掛了個測試版在後面了。

> 那麼，會有正式版嗎?

好問題，我也不知道。我連我要不要持續維護這個專案都還不太確定(笑)。

> 為什麼README是中文?

因為我懶。

> 看起來太複雜了，有沒有生成器啊?

目前沒有，我再考慮考慮。所有名為 `demo` 的資料夾內都有現成可以直接運作的檔案，去研究看看或許會有些收穫喔。

> 你做的功能我都會用了，但是我還想要某某功能卻不在裡面，該怎麼辦?

我會建議你直接魔改這個資料包喔，因為我也不能保證一定會把你要求的功能放進去。

## 目錄
- [末天的恩批吸-beta](#末天的恩批吸-beta)
  - [目錄](#目錄)
  - [展示用檔案](#展示用檔案)
  - [命名空間](#命名空間)
  - [基本檔案](#基本檔案)
    - [進度](#進度)
    - [函數](#函數)
  - [互動設定](#互動設定)
    - [MCDOC](#mcdoc)
    - [根設定](#根設定)
      - [通常NPC](#通常npc)
      - [商店NPC](#商店npc)
    - [設定物件列表](#設定物件列表)
      - [對話設定](#對話設定)
      - [離開設定](#離開設定)
      - [閒置設定](#閒置設定)
      - [音效設定](#音效設定)
      - [交易選項設定](#交易選項設定)
      - [選項列表設定](#選項列表設定)
      - [額外設定](#額外設定)
      - [選項設定](#選項設定)
      - [時間範圍設定](#時間範圍設定)
      - [物品堆疊設定](#物品堆疊設定)
      - [音效覆寫設定](#音效覆寫設定)
      - [選項條件設定](#選項條件設定)
  - [任務流程](#任務流程)
    - [任務節點](#任務節點)
    - [任務對話](#任務對話)
    - [回呼函數](#回呼函數)
    - [任務提示](#任務提示)
    - [其他建議](#其他建議)

## 展示用檔案

本資料包有附上能夠實際運作的展示用檔案，要召喚展示用NPC的話請執行下列函數:

* `function npc:demo/endsky/summon`
* `function npc:demo/radio/summon`
* `function npc:demo/davleek/summon`
* `function npc:demo/howhow/summon`

若要觸發展示用任務，請執行下列函數後，與相應的NPC互動:

* `function quest:demo/mysterious_stone/set` - 與「測試測試收音機」互動。
* `function quest:demo/sus_mysterious_stone/set` - 與「測試用天天機器人」互動，對話直到選項出現，選擇「交談」。

## 命名空間

NPC系統使用了以下三個命名空間:

* `endsky_npc`
* `npc`
* `quest`

第一項命名空間是資料包運作時會使用到的相關系統 (除非你知道自己在做什麼，不然最好不要動這裡的東西)。  
後兩項命名空間則是用於儲存對話腳本及各式設定 (也就是你用來設計NPC的地方)。  
`npc` 的命名空間可以設定一個NPC的外觀、通常對話以及商人所販售的物品等等，並且扮演著能從個別的NPC來啟動其他功能的角色。  
`quest` 的命名空間則將觸發任務時的對話獨立了出來，並儲存著跟任務有關的對話中會執行的函數。  

## 基本檔案

在這個系統中，一個最簡單的NPC由至少6個檔案所組成。  
此6個檔案分別為2個進度與4個函數，並依照NPC所在的區域來分資料夾。      

### 進度

NPC的基本進度如下列所示:

* `data/npc/advancement/<region_id>/<npc_id>/start.json`
* `data/npc/advancement/<region_id>/<npc_id>/next.json`

其中 "start" 進度會偵測玩家開始與特定NPC互動，"next" 進度則能偵測所有後續的互動。  

以下提供各檔案之模板，請於複製到目標檔案夾後更改檔案名稱及後綴，將 `<region_id>` 替換成地區代號、`<npc_id>` 替換成NPC代號 (請全部使用英文小寫字母及英文底線)。  
* "start" 進度之[模板](data/npc/advancement/template/start)
* "next" 進度之[模版](data/npc/advancement/template/next)

### 函數

NPC的基本函數如下列所示:

* `data/npc/function/<region_id>/<npc_id>/summon.mcfunction`
* `data/npc/function/<region_id>/<npc_id>/dialogues.mcfunction`
* `data/npc/function/<region_id>/<npc_id>/start.mcfunction`
* `data/npc/function/<region_id>/<npc_id>/next.mcfunction`
* `data/npc/function/<region_id>/<npc_id>/override.mcfunction`

此五個函數可分為「設定類」及「執行類」。  

設定類包含 "summon" 及 "dialogues" 函數，其中 "summon" 用於設定外觀及原地召喚該NPC，"dialogues" 初始化通常對話內容。  
應注意的是，"dialogues" 函數的實際功能為設定「指令空間 (command storage)」的內容，如果召喚NPC時相應的storage沒有內容，將會自動呼叫此函數。另外，storage的內容是有可能會隨著系統的運行產生變化的，因此呼叫此函數也有「重設」的效果。  
設定類函數應由區域管理系統呼叫 (如果你有寫的話，沒有的話手動呼叫一次然後祈禱這些NPC直到你的地圖發布時都不會壞掉吧)。亦可撰寫多個版本的設定類函數 (至少要各有一個叫做上面的名字)，使NPC能在遊戲不同階段產生變化。  

執行類包含 "start"、"next" 及 "override" 函數，其中 "start" 用於回應 "start" 進度的呼叫以及開啟NPC對話，"next" 則用於回應 "next" 進度及推進對話過程。  
而 "override" 函數是任務系統得以運作的關鍵，其功能是在符合相關條件時以指定的對話取代通常對話，若無相關任務對話可省略此函數。(普通NPC的觸發時機為觸發對話時，商店NPC的觸發時機為點擊選單的「交談」後。)  


以下提供各檔案之模板，請於複製到目標檔案夾後更改檔案名稱及後綴，將 `<region_id>` 替換成地區代號、`<npc_id>` 替換成NPC代號 (請全部使用英文小寫字母及英文底線，不接受空格)。  
* "summon" 函數之[模板](data/npc/function/template/summon)
  * 此函數中應召喚三種實體
    1. 顯示本體: 通常為盔甲架或村民，亦可使用其他實體。會於對話中持續面向啟動對話的玩家，對話結束後將轉回初始設定的轉向。其CustomName用於儲存顯示的NPC名稱。
       * 可召喚其他顯示用實體，應有的tag有 `"npc.tag"` 及 `"npc.<redion_id>.<npc_id>"`。
    2. 互動實體: 用於偵測玩家互動，觸發進度。其碰撞箱大小設定應包覆整個顯示本體，或是符合玩家的直覺。
    3. 特製名條: 本系統使用文字顯示實體來替代傳統的實體名條，他會在進入和離開對話時移動位置。一般來說這個只需要調整其召喚之相對高度即可 (建議為顯示本體碰撞箱高度+0.475)，其餘NBT不須調整。
* "dialogue" 函數之[普通模板](data/npc/function/template/dialogues%20(common))及[商店模板](data/npc/function/template/dialogues%20(trader))，寫法將在[互動設定](#互動設定)中詳細說明
* "start" 函數之[模板](data/npc/function/template/start)
* "next" 函數之[模板](data/npc/function/template/next)
* "override" 函數之[模板](data/npc/function/template/override)

## 互動設定

所有跟NPC互動時的對話、選項等，可在 "dialogue" 函數中設定，設定方法為對該NPC所擁有的「指令空間 (command storage)」進行編輯。  
(因此請先確保自己能夠操作 `/data modify` 指令的相關基礎功能再來喔。)  
每個NPC都有其獨立的 `storage`，位置為 `npc:<region_id>` 中的 `<npc_id>` 標籤，這些位置底下的子標籤會影響該NPC的行為，以下將列出有效的子標籤。  

### MCDOC

Mcdoc是在[Spyglass](https://github.com/SpyglassMC/Spyglass)(一個VSCode的資料包資源包格式插件)中用於定義SNBT路徑格式的語法，對於工具資料包來說此功能尤為方便。  
此部分的格式我有寫一個 `.mcdoc` 檔案支援，但對於每個 `storage` 都需要額外設定才會套用上去。關於這部分的教學我稍後或許會補上。  

### 根設定


#### 通常NPC
The following are the settings for all NPCs.  
下列為所有NPC皆擁有的設定。  

* Normal:
  * List of [dialogue setting](#對話設定) objects. Stores multiple normal dialogues, witch will be selected in order by default.
  * [對話設定](#對話設定)物件的列表。可儲存多個普通對話，預設會按順序選擇。
* NormalRandom:
  * Boolean. If true, the dialogues will be randomly selected. Defaults to false.
  * 布林值。若為 true，對話將會隨機選擇。預設為 false。
* Exit:
  * [Exit setting](#離開設定) object. The dialogue when the player exits the NPC. Effective only when options is triggered or "Trader" is true.
  * [離開設定](#離開設定)物件。玩家離開 NPC 時的對話。僅在選項觸發或 "Trader" 為 true 時有效。
* Idle:
  * [Idle setting](#閒置設定) object. The texts when the NPC is idle.
  * [閒置設定](#閒置設定)物件。NPC 閒置時的文字。
* SoundPool:
  * List of [sound setting](#音效設定) objects. Common sound pool where sounds will be choosen randomly from when the NPC displays any text. If omitted, the default villager sound will be played.
  * [音效設定](#音效設定)物件的列表。NPC 顯示任何文字時將於其中隨機選擇音效的通用音效池。若省略，將播放預設的村民音效。

#### 商店NPC
Trader NPCs has more settings besides the settings above. The following are the extra settings for the trader NPCs.  
商店NPC除了上述設定外需要設定更多東西。下列為商店NPC獨有的額外設定。  

* Trader:
  * Boolean. If true, the NPC will be a trader. Defaults to false.
  * 布林值。若為 true，NPC 將會是一個商人。預設為 false。
* TraderNormal:
  * List of [dialogue setting](#對話設定) objects. Effective only when "Trader" is true. The dialogues for trader NPCs after triggering "chat".
  * [對話設定](#對話設定)物件的列表。僅在 "Trader" 為 true 時有效。觸發「交談」後商人 NPC 的普通對話。
* TraderNormalRandom:
  * Boolean. Effective only when "Trader" is true. If true, the trader dialogues will be randomly selected. Defaults to false.
  * 布林值。僅在 "Trader" 為 true 時有效。若為 true，商人對話將會隨機選擇。預設為 false。
* Buy:
  * List of [trading option setting](#交易選項設定) objects. Effective only when "Trader" is true. Trading options inside the "Buy" villager.
  * [交易選項設定](#交易選項設定)物件的列表。僅在 "Trader" 為 true 時有效。「購入」村民內的交易選項。
* Sell:
  * List of [trading option setting](#交易選項設定) objects. Effective only when "Trader" is true. Trading options inside the "Sell" villager.
  * [交易選項設定](#交易選項設定)物件的列表。僅在 "Trader" 為 true 時有效。「售出」村民內的交易選項。

### 設定物件列表

#### 對話設定

* Texts:
  * List of text components. The multiple dialogue texts that will be orederly displayed.
  * 文字元件的列表。將會按順序顯示的多段對話文字。
* Once:
  * Boolean. Optional. If true, the dialogue will be triggered only once. Defaults to false.
  * 布林值。選填。若為 true，對話將只會觸發一次。預設為 false。
* Options:
  * [Option list setting](#選項列表設定) object. Optional. If present, a list of options will be displayed when the dialogue ends.
  * [選項列表設定](#選項列表設定)物件。選填。若存在，對話結束時將會顯示選項列表。
* Extra:
  * [Extra setting](#額外設定) object. Optional. Common extra settings for dialogues.
  * [額外設定](#額外設定)物件。選填。對話的通用額外設定。

#### 離開設定

* Texts:
  * List of text components. The multiple dialogue texts that will be orederly displayed.
  * 文字元件的列表。將會按順序顯示的多段對話文字。
* Extra:
  * [Extra setting](#額外設定) object. Optional. Common extra settings for dialogues.
  * [額外設定](#額外設定)物件。可選。對話的通用額外設定。

#### 閒置設定

* Text:
  * The single dialogue text that will be displayed. The one-lined text that will be displayed.
  * 將會顯示的單段對話文字。將會顯示的單行文字。
* Duration:
  * [Time range setting](#時間範圍設定) object. The display duration in seconds. Fixed value and range representation are both supported.
  * [時間範圍設定](#時間範圍設定)物件。顯示時間（秒）。支援固定值和範圍表示。
* Rest:
  * [Time range setting](#時間範圍設定) object. The rest time in seconds. Fixed value and range representation are both supported.
  * [時間範圍設定](#時間範圍設定)物件。休息時間（秒）。支援固定值和範圍表示。
* SoundPool:
  * List of [sound setting](#音效設定) objects. Optional. Sounds that will be played when the idle text is displayed. If omitted, the sound pool in the root is used.
  * [音效設定](#音效設定)物件的列表。可選。當顯示閒置文字時將會播放的音效。若省略，將使用根目錄中的音效池。

#### 音效設定

* id:
  * String. The sound event ID.
  * 字串。音效事件 ID。
* setting:
  * Optional. The detailed sound setting.
  * 可選。音效的詳細設定。
  * volume:
    * Float. Optional. The volume of the sound. Must be greater than or equal to 0. Defaults to 1.
    * 單精度浮點數。可選。音效的音量。必須大於或等於 0。預設為 1。
  * pitch:
    * Float. Optional. The pitch of the sound. Must be inclusivly between 0 and 2. Values less than 0.5 are equavalent to 0.5. Defaults to 1.
    * 單精度浮點數。可選。音效的音調。必須在 0 到 2 之間。小於 0.5 的值等效於 0.5。預設為 1。
  * minVolume:
    * Float. Optional. The minimum volume of the sound. Must be inclusivly between 0 and 1. Valus greater than 0 will make all players hear the sound regardless of distance. Defaults to 0.
    * 單精度浮點數。可選。音效的最小音量。必須在 0 到 1 之間。大於 0 的值將使所有玩家無論距離如何都能聽到音效。預設為 0。

#### 交易選項設定

* buy:
  * [Item stack setting](#物品堆疊設定) object. The item stack needed for the offer.
  * [物品堆疊設定](#物品堆疊設定)物件。交易所需的物品堆疊。
* bugB:
  * [Item stack setting](#物品堆疊設定) object. Optional. The extra item stack needed for the offer.
  * [物品堆疊設定](#物品堆疊設定)物件。可選。交易所需的額外物品堆疊。
* sell:
  * [Item stack setting](#物品堆疊設定) object. The item stack that the player will get from the offer.
  * [物品堆疊設定](#物品堆疊設定)物件。玩家將從交易中獲得的物品堆疊。
* maxUses:
  * Integer. The maximum number of times the offer can be used. 2147483647 for infinite.
  * 整數。交易可使用的最大次數。2147483647 表示無限次數。

#### 選項列表設定

* List:
  * List of [option setting](#選項設定) objects. The options to choose from. The maximum number of options is 4.
  * [選項設定](#選項設定)物件的列表。可選擇的選項。最多 4 個選項。
* LoopBack:
  * Boolean. Optional. If true, after the chosen dialogue ends, the options will be displayed again. Defaults to false.
  * 布林值。選填。若為 true，在選擇的對話結束後，選項將會再次顯示。預設為 false。
* NoExit:
  * Boolean. Optional. If true, the "Exit" option will not show. Defaults to false.
  * 布林值。選填。若為 true，將不會顯示「離開」選項。預設為 false。

#### 額外設定

* StartCommand:
  * Command as string. Optional. The command that will be executed when the dialogue starts.
  * 字串形式的指令。可選。對話開始時將會執行的指令。
* EndCommand:
  * Command as string. Optional. The command that will be executed when the dialogue ends normally.
  * 字串形式的指令。可選。對話正常結束時將會執行的指令。
* LeaveCommand:
  * Command as string. Optional. The command that will be executed when the dialogue ends due to the player leaving.
  * 字串形式的指令。可選。因玩家離開導致對話結束時將會執行的指令。
* SoundOverrides:,
  * List of [sound override setting](#音效覆寫設定) objects. Optional. Overrides sound pool for the indicated section of dialogue.
  * [音效覆寫設定](#音效覆寫設定)物件的列表。可選。覆蓋指定對話部分的音效池。

#### 選項設定

* Option:
  * Text component. The text that will be displayed as the option name.
  * 文字元件。將會顯示為選項名稱的文字。
* React:
  * List of text components. The multiple dialogue texts that will be orederly displayed when the option is selected.
  * 文字元件的列表。選擇該選項時將會按順序顯示的多段對話文字。
* Condition:
  * [Option condition setting](#選項條件設定) obejct. Optional. If present, the option won't be selectable if the condition do not match.
  * [選項條件設定](#選項條件設定)物件。選填。若此項存在，當條件不符合時該選項將無法選擇。
* LoopBack:
  * Boolean. Optional. Independent setting for whether the same options to be displayed again when the dialogue ends.
  * 布林值。選填。獨立設定對話結束後是否再次顯示相同選項。
* Extra:
  * [Extra setting](#額外設定) object. Optional. Common extra settings for dialogues.
  * [額外設定](#額外設定)物件。選填。對話的通用額外設定。

#### 時間範圍設定
Can be a simple integer or the following structure:  
可為單純的整數或下列結構:  

* min:
  * Integer. The minimum value of the range. Must be greater than or equal to 0.
  * 整數。範圍的最小值。必須大於或等於 0。
* max:
  * Integer. The maximum value of the range. Must be greater than the minimum value.
  * 整數。範圍的最大值。必須大於最小值。

#### 物品堆疊設定
Can be a ordinary item stack representation or the following structure:  
可為正常的物品堆疊表示法或下列結構:  

* Name:
  * ID of the loot table.
  * 戰利品表的 ID。
* Count:
  * Until 1.20.5. Byte. Number of items in the stack.
  * 至 1.20.5 前。Byte 整數。堆疊中的物品數量
* count:
  * Since 1.20.5. Integer. Number of items in the stack.
  * 自 1.20.5 起。整數。堆疊中的物品數量

#### 音效覆寫設定

* index:
  * Integer. The index of the dialogue section that the sound pool will be overridden.
  * 整數。要覆蓋音效池的目標對話段落的索引。
* pool:
  * List of [sound setting](#音效設定) objects. The sound pool to use instead.
  * [音效設定](#音效設定)物件的列表。要使用的音效池。

#### 選項條件設定

* Type:
  * String. Type of the condition, can be "item", "score", or "command".
  * 字串。條件的類型，可以是 "item"、"score" 或 "command"。
* Value:
  * Content depends on the type of the condition.
  * 內容取決於條件的類型。

## 任務流程

<u>**注意**</u>: 此處的任務是以所有玩家共同進度的方式來設計的，若你需要其他的任務系統，請自己想辦法:)既然都看到這裡了，我相信你可以的。另外，其實這裡並沒有實質意義上的任務系統，所以此處的內容完全僅供參考。  

任務同樣以區域來分資料夾，如果要設計跨區域的任務，以任務開始的區域為準。  
每個任務要分配一個代號 (`quest_id`)，例如: `mysterious_stone`。  
同一個任務相關的進度及函數應儲存在下列路徑:

* `data/quest/advancement/<region_id>/<quest_id>/` 
* `data/quest/function/<region_id>/<quest_id>/`
  
且應將記分板 `quest.state` 在假玩家 `$<region_id>.<quest_id>` 底下的分數作為任務狀態之紀錄。  
任務狀態記分板中的分數為判斷當前任務進度的重要依據。  


### 任務節點

此處的節點是指實際設計任務時的一個概念，並非此系統中的功能。  
一個任務會有兩個或以上的節點存在，節點間通常呈現順序關係 (如果你很厲害的話也可以設計分支啦)。  
節點會推進任務進度並且通常會給予玩家一個遊戲內的進度來提示接下來的行動。  
通常一個任務節點應包含:

* 一個提示用的進度
* 該任務的記分板狀態更新 *(可以是有條件的)*
* *可給予或收走任務道具*
* *可給予任務獎勵*

### 任務對話

若要使一個NPC在任務到達某個進度時觸發特殊對話，應在其["override"函數](#函數)中插入判斷任務狀態記分板的條件式，並從任務的 `storage` 提取該特殊對話之設定，格式請參考[模板檔案](data/npc/function/template/override)。  
而任務相關特殊對話所應儲存的位置為: `storage quest:<region_id> <quest_id>.<dialogue_name>` (其中"dialogue_name"只要不重複並命名並能夠辨識其功能即可)。  
特殊對話的格式與NPC系統中的Normal內的一項相同。  
同一個任務的特殊對話，建議以同一個函數設定並按照順序排列，<u>**強烈建議**</u>為每行加上註解，說明此段對話於記分板為幾分時，由哪個NPC所觸發。  
於此提供一個任務對話設定函數的[模板](data/quest/function/template/dialogues)

### 回呼函數

如果要在與NPC對話時觸發一個任務節點，應使用NPC系統中的「回呼函數」功能 (參見[通常設定](#通常設定)的Extra標籤)。  
Extra標籤中的StartCommand、EndCommand、LeaveCommand應設為一個合法指令的字串，通常該指令為呼叫函數的指令，執行者為與該NPC對話中的玩家。  
使用場合範例: 於「接受任務」選項中放入EndCommand，將在該對話結束後執行「開始任務」的函數。  
於此提供一個回呼函數的[模板](data/quest/function/template/callback)。  

亦可不由NPC觸發任務節點，此時於其他檔案中直接呼叫一個函數即可。  

### 任務提示

任務進度之提示以「進度」功能達成，預計同一個區域的任務會共用同一個根進度，並且同一個任務的進度提示要串起來，形成明顯的先後關係。  
任務提示全部設定為隱藏進度 (觸發後才會顯示)。  
另外，我設計了一個方式可以讓剛上線的玩家自動根據任務記分板的數值更新他自身的進度，詳細情形請見任務提示模板。  
於此提供一個任務提示的[模板](data/quest/advancement/template/hint)。  

### 其他建議

由NPC所觸發的特殊任務對話可以不只是任務節點相關，也可根據當前任務進度給予符合情境的對話，甚至順便提供更多的提示。  
於"start"函數中判斷任務狀態給予不同對話的指令，若有異於該記分板的條件要判斷，亦可額外創建一個函數進行進一步的判斷。  




如果還有有任何疑問，可以聯絡作者本人，如果聯絡不上，那再看一遍這個檔案好了。  
字超多，看不太懂，還是不清楚要怎麼做，我知道。

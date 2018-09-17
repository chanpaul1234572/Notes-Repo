# Python中的單底線和雙底線
## 在Python中類別的型態和包含在裡面的物件都是public，不需要特別宣告是public還是private，因此在使用上，python使用了單底線 (_)和雙底線 (__)來區別變數，以避免混淆：

- _single_leading_underscore
- single_trailing_underscore_
- __double_leading_underscore
- \__double_leading_and_trailing_underscore\__
### 一、_single_leading_underscore
變數前面加一個單底線 (Module private)

```
_single_leading_underscore: weak “internal use” indicator. 
E.g. from M import * does not import objects whose name starts with an underscore.
```
python裡頭沒有真正的private variables，但我們可以在variable的前面加上一個底線 (underscore)當作private，用意是要告訴大家這個variable只適用於宣告它們的模組中所使用，不能直接的訪問或修改，但是因為沒有強制的效力，所以我們仍可強制呼叫單底線開頭的variable。

這裡有比較詳細的解釋

```
“Private” instance variables that cannot be accessed except from inside an object don’t exist in Python. 
However, there is a convention that is followed by most Python code: a name prefixed with an underscore (e.g. _spam) 
should be treated as a non-public part of the API (whether it is a function, a method or a data member). 
It should be considered an implementation detail and subject to change without notice.
```

### 二、single_trailing_underscore_
變數名稱後面加一個底線

single_trailing_underscore_: used by convention to avoid conflicts with Python keyword
根據PEP8的說明，在變數名稱後面加上一個單底線的用意在於避免與Python的keyword和Builtin函數搞混。例如：```class_```。

### 三、__double_leading_underscore
變數前面加一個雙底線 (class private)

```
__double_leading_underscore: when naming a class attribute, invokes name mangling (inside class FooBar, __boo becomes _FooBar__boo; see below).
```
Class Private除非外部強制呼叫，不然與module privateㄧ樣不能隨意的存取訪問，但Class物件被建立的時侯，所有雙底線開頭的變數```__foo```會被name mangling成```__ClassName__foo```，以避免繼承時的名稱混淆。

### 四、__double_leading_and_trailing_underscore__
變數前後各加一個雙底線

```
“magic” objects or attributes that live in user-controlled namespaces. 
E.g. __init__, __import__ or __file__. Never invent such names; only use them as documented.
```
官方建議我們不要自創這類的名稱，只照文件的說明去使用它們就好，雖然我們仍然可以自創修改，但如果怕python壞掉，還是不要亂碰比較好。

### 總結
如果覺得還是很不清楚，推薦可以直接去看 PEP8，裡頭對於變數使用有很詳細的解釋，這裡也有中文版的解釋。



### acknowledge: I shamelessly copied from Mr Min-Sian, Su's article: [Python中的單底線和雙底線](https://medium.com/siansiansu/%E5%9C%A8python%E4%B8%AD%E9%A1%9E%E5%88%A5%E7%9A%84%E5%9E%8B%E6%85%8B%E5%92%8C%E5%8C%85%E5%90%AB%E5%9C%A8%E8%A3%A1%E9%9D%A2%E7%9A%84%E7%89%A9%E4%BB%B6%E9%83%BD%E6%98%AFpublic-%E4%B8%8D%E9%9C%80%E8%A6%81%E7%89%B9%E5%88%A5%E5%AE%A3%E5%91%8A%E6%98%AFpublic%E9%82%84%E6%98%AFprivate-%E5%9B%A0%E6%AD%A4%E5%9C%A8%E4%BD%BF%E7%94%A8%E4%B8%8A-python%E4%BD%BF%E7%94%A8%E4%BA%86%E5%96%AE%E5%BA%95%E7%B7%9A-%E5%92%8C%E9%9B%99%E5%BA%95%E7%B7%9A-%E4%BE%86%E5%8D%80%E5%88%A5%E8%AE%8A%E6%95%B8-%E4%BB%A5%E9%81%BF%E5%85%8D%E6%B7%B7%E6%B7%86-8c9b339af560)

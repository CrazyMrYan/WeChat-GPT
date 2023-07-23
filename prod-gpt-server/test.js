const app = require("express")();
const sha1 = require("sha1");

app.use((req,res,next)=>{
    // GET请求携带参数是个参数signature,timestamp,nonce,echostr
    const {signature,timestamp,nonce,echostr} = req.query;
    
    // 服务器的token
    const token = "gptpro";

    // 将token、timestamp、nonce三个参数进行字典序排序 
    const arrSort = [token,timestamp,nonce];
    arrSort.sort();

    // 将三个参数字符串拼接成一个字符串进行sha1加密,npm install --save sha1
    const str = arrSort.join("");
    const shaStr = sha1(str);
    console.log(echostr);
    // 获得加密后的字符串可与signature对比，验证标识该请求来源于微信服务器
    if(shaStr === signature){
        // 确认此次GET请求来自微信服务器，请原样返回echostr参数内容，则接入生效
        res.send(echostr);
    }else{
        //否则接入失败。
        res.send("no");
    }
});

app.listen(3000,()=>console.log("3000端口号成功运行"));
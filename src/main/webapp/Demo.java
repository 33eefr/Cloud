package com.cloud.dao;

/*import java.io.*;//导入所需的包
public class Demo {//类
	public static void main(String[] args){//主程序，程序入口
		File file=new File("D:\\Qiju_Li");
		if(!file.exists()){//如果文件夹不存在
			file.mkdir();//创建文件夹
		}
		try{//异常处理
			//如果Qiju_Li文件夹下没有Qiju_Li.txt就会创建该文件
			BufferedWriter bw=new BufferedWriter(new FileWriter("D:\\Qiju_Li\\Qiju_Li.txt"));
			bw.write("Hello I/O!");//在创建好的文件中写入"Hello I/O"
			bw.close();//一定要关闭文件
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}*/
package com.datongsoft.wg.common.util;

import java.net.InetAddress;
public class GetIP {
 
    /**
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
         InetAddress addr = InetAddress.getLocalHost();  
         String ip=addr.getHostAddress().toString(); //获取本机ip  
         String hostName=addr.getHostName().toString(); //获取本机计算机名称  
         System.out.println(ip);
         System.out.println(hostName);
    }
 
}

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Properties;


/**
 **/
public class jdbc_set_get_object_case0014 {
    static public String driver = "org.postgresql.Driver";
    public static Properties getConfigFromFile(String filePath) {
        Properties props = new Properties();
        try {
            BufferedInputStream config = new BufferedInputStream(new FileInputStream(filePath));
            props.load(config);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return props;
    }

    public static String genURLFromPro(Properties props) {
        String hostname = props.getProperty("hostname");
        String[] hostnames = hostname.split(",");
        String port = props.getProperty("port");
        String[] ports = port.split(",");
        String dbname = props.getProperty("dbname");
        return genURLFromHostsPortsDBname(hostnames, ports, dbname);
    }

    public static String genURLFromHostsPortsDBname(String[] hostnames, String[] ports, String dbname) {
        String sourceURL;
        if (hostnames.length == 1) {
            sourceURL = "jdbc:postgresql://" + hostnames[0] + ":" + ports[0] + "/" + dbname;
        } else {
            ArrayList<String> ip_port_pare = new ArrayList<>();
            if (ports.length == 1) {
                for (String ip : hostnames) {
                    ip_port_pare.add(ip + ":" + ports[0]);
                }
            } else {
                for (int i = 0; i < hostnames.length; i++) {
                    ip_port_pare.add(hostnames[i] + ":" + ports[i]);
                }
            }
            sourceURL = "jdbc:postgresql://" + String.join(",", ip_port_pare) + "/" + dbname;
        }
        return sourceURL;
    }

    public static Connection GetConnection(Properties props) {
        Connection connR;
        String sourceURL = genURLFromPro(props);
        try {
            Class.forName(driver).newInstance();
            connR = DriverManager.getConnection(sourceURL, props);
        } catch (Exception var10) {
            var10.printStackTrace();
            return null;
        }
        return connR;
    }


    public static void main(String[] args) {
        Properties pros = new Properties();
        Properties pros_conf=null;
        String jdbc_config_file = null;
        for (int i = 0; i < args.length; i++) {
            switch (args[i]) {
                case "--config-file":
                    jdbc_config_file = args[i + 1];
                    pros_conf=getConfigFromFile(jdbc_config_file);
                    break;
                case "-F":
                    jdbc_config_file = args[i + 1];
                    pros_conf=getConfigFromFile(jdbc_config_file);
                    break;
                default:
                    break;
            }
        }
        //建立连接
        if (pros_conf!=null){
            //以参数为准，覆盖配置文件中的
            pros_conf.putAll(pros);
        }
        Connection conn = GetConnection(pros_conf);
        if(conn==null){
            System.out.println("连接失败");
            return;
        }else{
            try{
                String sql = "insert into jdbc_set_get_object_case0014 values(?)";
                PreparedStatement ps_insert=conn.prepareStatement(sql);
                ps_insert.setObject(1,"infinity");
                ps_insert.execute();
                ps_insert.setObject(1,"-infinity");
                ps_insert.execute();
                ps_insert.setObject(1,"epoch");
                ps_insert.execute();
                ps_insert.setObject(1,"now");
                ps_insert.execute();
                ps_insert.setObject(1,"tomorrow");
                ps_insert.execute();
                ps_insert.setObject(1,"yesterday");
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.MAX);
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.MIN);
                ps_insert.execute();
                ps_insert.setObject(1, null);
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.now());
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.ofEpochDay(1));
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.ofYearDay(2021,2));
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.of(2020, 2, 29));
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.now(ZoneOffset.of("+08:00")));
                ps_insert.execute();
                ps_insert.setObject(1, LocalDate.parse("2021-01-02", DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                ps_insert.execute();
                ps_insert.setObject(1,"today");
                ps_insert.execute();

                ps_insert.close();

            }catch (SQLException s){
                s.printStackTrace();
            }
        }
        try{
            conn.close();
        }catch (SQLException s){
            s.printStackTrace();
        }
        
    }
}
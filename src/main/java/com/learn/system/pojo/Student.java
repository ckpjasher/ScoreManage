package com.learn.system.pojo;

import java.sql.Date;
import java.text.SimpleDateFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
        private String stuNo;
        private String stuName;
  private Integer sex;
  private Date birthday;
  private String nat;
        private String classNo;
        public String getBirthday() {
            SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
            return simple.format(birthday);
        }
}

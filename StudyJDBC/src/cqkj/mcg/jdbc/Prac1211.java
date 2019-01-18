package cqkj.mcg.jdbc;

import java.util.ArrayList;
import java.util.List;


public class Prac1211
{
    @SuppressWarnings("unused")
    public static void main(String[] args)
    {
        List<Student> st = new ArrayList<Student>();
        List<Student> st1;
        Student s1 = new Student("100", "马达", 19, "女");
        Student s2 = new Student();
        StudentDao sd = new StudentDao();
        /*s2 = sd.selectById(41);
        System.out.println(s2.getStuId() + "," + s2.getStuNo() + "," + s2.getStuName() + "," + s2.getStuAge() + ","
                + s2.getStuSex());*/
        // sd.delete(32);
        // sd.insert(s1);
        /*st = sd.selectAll();
        for (Student s : st)
        {
            System.out.println(s.getStuId() + "," + s.getStuNo() + "," + s.getStuName() + "," + s.getStuAge() + ","
                    + s.getStuSex());
        }*/
        st1 = sd.selectPaging(2, 3);
        for (Student s : st1)
        {
            System.out.println(s.getStuId() + "," + s.getStuNo() + "," + s.getStuName() + "," + s.getStuAge() + ","
                    + s.getStuSex());
        }

    }

}

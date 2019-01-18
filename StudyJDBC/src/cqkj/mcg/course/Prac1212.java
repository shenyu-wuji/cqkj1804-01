package cqkj.mcg.course;

import java.util.ArrayList;
import java.util.List;

import cqkj.mcg.jdbc.StudentDao;

public class Prac1212
{

    public static void main(String[] args)
    {
        List<Course> cou = new ArrayList<Course>();
        
        Course c1 = new Course("C100","马克思李宁主义");
        Course c2 = new Course();
        CourseDao cd = new CourseDao();
        //c2 = cd.selectById(11);
        //System.out.println(c2.getcId() + "," + c2.getcNo() + "," + c2.getcName());
        
        //cd.delete(32);
        //cd.insert(c1);
        
        /*cou = cd.selectAll();
        for (Course c : cou)
        {
            System.out.println(c.getcId() + "," + c.getcNo() + "," + c.getcName());
        }*/
        //cou1 = cd.selectPaging(2, 3);
        
        List<Course> cou1 = cd.selectPaging(2, 3);
        for (Course c : cou1)
        {
            System.out.println(c.getcId() + "," + c.getcNo() + "," + c.getcName());
        }

    }

}

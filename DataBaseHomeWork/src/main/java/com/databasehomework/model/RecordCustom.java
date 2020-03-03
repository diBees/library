package com.databasehomework.model;

import java.util.Date;

public class RecordCustom extends Record
{
    private String bname;
    private Date start;

    public String getBname()
    {
        return bname;
    }

    public void setBname(String bname)
    {
        this.bname = bname;
    }

    public Date getStart()
    {
        return start;
    }

    public void setStart(Date start)
    {
        this.start = start;
    }
}

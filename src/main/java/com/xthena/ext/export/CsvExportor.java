package com.xthena.ext.export;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.xthena.core.util.ServletUtils;

public class CsvExportor implements Exportor {
    @Override
	public void export(HttpServletResponse response, TableModel tableModel)
            throws IOException {
        StringBuilder buff = new StringBuilder();

        for (int i = 0; i < tableModel.getColNameCount(); i++) {
            buff.append(tableModel.getColName(i));

            if (i != (tableModel.getColNameCount() - 1)) {
                buff.append(",");
            }
        }

        buff.append("\n");

        for (int i = 0; i < tableModel.getDataCount(); i++) {
            for (int j = 0; j < tableModel.getHeaderCount(); j++) {
                buff.append(tableModel.getValue(i, j));

                if (j != (tableModel.getHeaderCount() - 1)) {
                    buff.append(",");
                }
            }

            buff.append("\n");
        }

        response.setContentType(ServletUtils.STREAM_TYPE);
        ServletUtils.setFileDownloadHeader(response, tableModel.getName()
                + ".csv");
        response.getOutputStream().write(buff.toString().getBytes("GBK"));
        response.getOutputStream().flush();
    }
}

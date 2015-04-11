package com.xthena.form.engine;

import com.xthena.form.engine.model.FormModel;

public interface FormModelCache {
    FormModel getFormModel(String id);

    void setFormModel(FormModel formModel);
}

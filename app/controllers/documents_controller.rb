class DocumentsController < ApplicationController
  # DELETE /reports/1.js
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
  end
end
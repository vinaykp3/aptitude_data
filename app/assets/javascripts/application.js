// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//$.rails.allowAction = (link) ->
//return true unless link.attr('data-confirm')
//$.rails.showConfirmDialog(link) # look bellow for implementations
//    false # always stops the action since code runs asynchronously
//
//$.rails.confirmed = (link) ->
//    link.removeAttr('data-confirm')
//link.trigger('click.rails')
//
//$.rails.showConfirmDialog = (link) ->
//    message = link.attr 'data-confirm'
//html = """
//#confirmationDialog.modal
//    .modal-header
//    %a.close{"data-dismiss" => "modal"} ×
//%h3 #{message}
//    .modal-body
//    %p Are you sure you want to delete?
//.modal-footer
//    %a.btn{"data-dismiss" => "modal"} Cancel
//    %a.btn.btn-primary.confirm{"data-dismiss" => "modal"} OK
//"""
//$(html).modal()
//$('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
//
//$.rails.showConfirmDialog = (link) ->
//    html = """
//<div id="dialog-confirm" title="Are you sure you want to delete?">
//    <p>These item will be permanently deleted and cannot be recovered. Are you sure?</p>
//    </div>
//"""
//$(html).dialog
//resizable: false
//modal: true
//buttons:
//    OK: ->
//    $.rails.confirmed link
//$(this).dialog "close"
//Cancel: ->
//$(this).dialog "close"
//
//$.rails.showConfirmDialog = (link) ->
//    okButton =
//    type: 'btn btn-primary'
//text: 'Ok'
//click: (noty) -> $.rails.confirmed(link); noty.close()
//cancelButton =
//    type: 'btn btn-danger'
//text: 'Cancel'
//click: (noty) -> noty.close()
//noty
//text: link.attr('data-confirm')
//buttons: [okButton, cancelButton]
//closable: false
//timeout: false
//modal: true